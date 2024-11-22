class Cashier {
  //FIELDS
  color colour;
  PVector pos;
  int diameter;
  boolean isAsleep;
  int speed;
  int lastCustomerTime;
  ArrayList <Customer> customersInLine;
  ArrayList <Customer> customersLeaving;

  //CONSTRUCTOR
  Cashier(PVector p, int d, int t) {
    this.colour = blue;     // Default color for awake cashier
    this.pos = p;
    this.diameter = d;
    this.isAsleep = false;  // Awake by default
    this.speed = 3;         // Default speed
    this.lastCustomerTime = t;
    this.customersInLine = new ArrayList <Customer>();
    this.customersLeaving = new ArrayList <Customer>();
  }

  //METHODS
  void drawCashier() {
    fill(colour);
    circle(pos.x, pos.y, diameter);
  }
  
  void generateCustomer() {
    int customerAddChance = int(random(0, (10.25-customerInflow)*30));  // Random chance of adding a customer every frame based off the inflow rate
    if (customerAddChance == 0) {
      
      try{
        float customerAheadY = this.customersInLine.get( this.customersInLine.size()-1 ).pos.y;  // Getting the y coord of the customer ahead in line, if there is one
        if (customerAheadY >= diameter*1.5) {   // Draws a customer if the distance between the would be customer and the customer ahead of it is over/equal to 1.5 times the diameter
          this.customersInLine.add(new Customer( new PVector (this.pos.x, -diameter*0.5), diameter, customerPatience, customerSpeed)); 
        }
      }
        
      catch (Exception e) {  // If there is no customer ahead in line
        //try{  // Avoids errors from changing the cashier amount in the middle of generating customers
          this.customersInLine.add(new Customer( new PVector (this.pos.x, -diameter*0.5), diameter, customerPatience, customerSpeed)); //Draws a customer if there is no customer ahead in line
        //}
        //catch (Exception f) {}
      }
    }
  }

  void cashierUpdate() {
    this.speed = cashierSpeed;
  }

  float timeToCheckOut() {
    return random(2 - cashierSpeed, 6 - cashierSpeed) + 0.25;
  }

  void checkIfIdle() {
    if (customersInLine.size() == 0) {  // If there are no customers in line
      if (red(colour) < red(purple)) {   // Keeps adding red until the cashier turns purple
        if (int(random(0,2)) == 0) {
          colour += color(1,0,0);
        }
      }
      
      else {  // If the cashier is purple, make it fall asleep
        this.isAsleep = true;
        sleep();
      }
    } 
    
    else {  // Waking up when customers enter
      this.isAsleep = false;
      colour = blue;
    }
  }
  
  void sleep() {  // Drawing ZZZs
    fill(purple);
    if (frameCount % 60 < 20) { 
      textSize(15);
      text("Z", pos.x+10, pos.y-10);
    }
    else if (frameCount % 60 < 40) {
      textSize(20);
      text("Z", pos.x+20, pos.y-20);
    }
    else {
      textSize(25);
      text("Z", pos.x+30, pos.y-30);
    }
  }
  
}

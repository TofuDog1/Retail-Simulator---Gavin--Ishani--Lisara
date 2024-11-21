class Cashier {
  //FIELDS
  color colour;
  PVector pos;
  float diameter;
  boolean isAsleep;
  int speed;
  int lastCustomerTime;
  ArrayList <Customer> customersInLine;
  ArrayList <Customer> customersLeaving;

  //CONSTRUCTOR
  Cashier(PVector p, float d, int t) {
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

  void cashierUpdate() {
    this.speed = cashierSpeed;
  }

  float timeToCheckOut() {
    return random(2 - cashierSpeed, 6 - cashierSpeed);
  }

  void checkIfIdle() {
    if (customersInLine.size() == 0) {  // If there are no customers in line
      if (red(colour) < 155){
        if (int(random(0,2)) == 0){
          colour += color(1,0,0);
        }
      }
      
      else {
        this.isAsleep = true;
        sleep();
      }
    } 
    
    else {  // Waking up when customers enter
      this.isAsleep = false;
      colour = blue;
    }
  }
  
  void sleep(){
    fill(purple);
    if(frameCount % 60 < 20){  // Animating the ZZZ
      textSize(15);
      text("Z", pos.x+10, pos.y-10);
    }
    else if(frameCount % 60 < 40){
      textSize(20);
      text("Z", pos.x+20, pos.y-20);
    }
    else{
      textSize(25);
      text("Z", pos.x+30, pos.y-30);
    }
  }
  
}

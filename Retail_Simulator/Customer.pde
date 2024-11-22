class Customer {
  // FIELDS
  color colour;
  PVector pos;
  int diameter;
  int patience;
  int initialPatience; // Store the initial patience when the customer is created
  int aggression;
  
  boolean checkedOut;
  int timeArrivedAtCashier;
  float checkingOutTime;
  boolean leaving;
  int leftAmount;
  
  // CONSTRUCTOR
  Customer (PVector xy, int d, int p, int a) {    
   this.colour = yellow;  // Default color for customer
   this.pos = xy;
   this.diameter = d;
   this.patience = p;
   this.initialPatience = p;
   this.aggression = a;
   
   this.checkedOut = false;
   this.leaving = false;
   this.leftAmount = 0;
  }
  
  // METHODS
  void drawCustomer (float cashierX) {
    fill(colour);
    this.pos.x = cashierX - this.leftAmount;
    circle(pos.x, pos.y, diameter);
  }
  
  void moveAhead() {
    this.pos.y += 5;
  }
  
  void wait (ArrayList<Customer> customersInLine, ArrayList<Customer> customersLeaving, int index) {
    if (green(colour) > green(red)) {  // Gets angrier if not already maximum amount of angry
      if (int(random(0,patience)) == 0) {
        colour -= green(-1);
        colour = color(red(colour), green(colour), 0);
      }
    }    
    
    else {  // If max amount of angry
      boolean tooClose = false;
      for (Customer cust : customersInLine) {  // Checks if the customer leaving would bump into another customer leaving preparing to leave
        if (cust.leaving == true && PVector.dist(this.pos, cust.pos) <= 3*diameter) {
          tooClose = true;
        }
      }
      
      for (Customer cust : customersLeaving) {  // Checks if the customer leaving would bump into another customer already leaving
        if (PVector.dist(this.pos, cust.pos) <= 3*diameter) {
          tooClose = true;
        }
      }
      
      if (tooClose == false && index != 0 && index != 1) {  // Make the customer leave if the customer leaving would not bump into another customer
      // Make the customer leave if they aren't first/second in line
        if (int(random(0,6-aggression)) == 0) {
          //fight
        }
        else {
          checkedOut = true;
          leaving = true;
        }
      }
    }
    
  }
  
  void checkOut (int time) {
    this.checkedOut = true;
    if ((time - this.timeArrivedAtCashier) / 1000 > checkingOutTime) {
      this.leaving = true;
    }
  }
  
  void leaveLeft() {
    this.leftAmount += 2.5;
  }
  
  void leaveUp() {
    this.pos.y -= 2.5;
  }
  
  void customerUpdate() {
    this.patience = customerPatience;
    this.aggression = customerAggression;
  }
  
  
}

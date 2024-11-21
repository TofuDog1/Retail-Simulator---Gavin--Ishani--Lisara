class Customer {
  //FIELDS
  color colour;
  PVector pos;
  int diameter;
  int patience;
  int aggression;
  
  boolean checkedOut;
  int timeArrivedAtCashier;
  float checkingOutTime;
  boolean leaving;
  int leftAmount;
  
  //CONSTRUCTOR
  Customer(PVector xy, int d, int p, int a) {    
   this.colour = yellow;  // Default color for customer
   this.pos = xy;
   this.diameter = d;
   this.patience = p;
   this.aggression = a;
   
   this.checkedOut = false;
   this.leaving = false;
   this.leftAmount = 0;
   
  }
  
  //METHODS
  void drawCustomer(float cashierX) {
    fill(colour);
    this.pos.x = cashierX - this.leftAmount;
    circle(pos.x, pos.y, diameter);
  }
  
  void moveAhead() {
    this.pos.y += 5;
  }
  
  void checkOut(int time){
    this.checkedOut = true;
    if((time - this.timeArrivedAtCashier) / 1000 > checkingOutTime) {
      this.leaving = true;
    }
  }
  
  void leaveLeft(){
    this.leftAmount += 2.5;
  }
  
  void leaveUp(){
    this.pos.y -= 2.5;
  }
  
  void customerUpdate() {
    this.patience = customerPatience;
    this.aggression = customerAggression;
  }
  
  
}

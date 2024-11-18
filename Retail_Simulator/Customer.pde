class Customer {
  //FIELDS
  color colour;
  PVector pos;
  int diameter;
  int patience;
  int aggression;
  
  //CONSTRUCTOR
  Customer(PVector xy, int d, int p, int a) {    
   this.colour = yellow;  // Default color for customer
   this.pos = xy;
   this.diameter = d;
   this.patience = p;
   this.aggression = a;
   
  }
  
  //METHODS
  void drawCustomer() {
    fill(this.colour);
    circle(this.pos.x, this.pos.y, this.diameter);
  }
  
  void moveAhead() {
    this.pos.y += 5;
  }
  
  
}

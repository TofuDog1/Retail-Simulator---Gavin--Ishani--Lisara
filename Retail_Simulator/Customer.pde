class Customer {
  //FIELDS
  PVector location;
  int diameter;
  color colour;
  int patience;
  int aggression;
  
  //CONSTRUCTOR
  Customer(PVector xy, int d, color c, int p, int a) {    
   this.location = xy;
   this.diameter = d;
   this.colour = c;
   this.patience = p;
   this.aggression = a;
   
  }
  
  //METHODS
  void drawCustomer() {
    fill(this.colour);
    circle(this.location.x, this.location.y, this.diameter);
  }
  
  
}

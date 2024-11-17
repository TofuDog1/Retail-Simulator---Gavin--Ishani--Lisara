class Cashier {
  //FIELDS
  color colour;
  PVector pos;
  float diameter;
  boolean isAsleep;
  int cashierSpeed;
  int lastCustomerTime;
  ArrayList <Customer> customersInLine;

  //CONSTRUCTOR
  Cashier(PVector p, float d, int t) {
    this.colour = blue;  // Default color for awake cashier
    this.pos = p;
    this.diameter = d;
    this.isAsleep = false; //Awake by default
    this.cashierSpeed = 3; // Default speed
    this.lastCustomerTime = t;
    this.customersInLine = new ArrayList <Customer>();
  }

  //METHODS
  void drawCashier() {
    if (this.isAsleep) {
      this.colour = purple;  // Purple if asleep
    } 
    else {
      this.colour = blue;    // Blue if awake
    }
    
    fill(colour);
    circle(pos.x, pos.y, diameter);
  }

  void increaseSpeed() {
    cashierSpeed++; //don't need this, gui will control
  }

  float timeToCheckOut() {
    return random(3 - (0.5 * cashierSpeed), 8 - (0.5 * cashierSpeed));
  }

  void checkIfIdle(float idleTime) {
    if (idleTime > 6) {  // If cashier has been idle for more than 6 seconds
      this.isAsleep = true;
    } 
    else {
      this.isAsleep = false;
    }
  }
  
}

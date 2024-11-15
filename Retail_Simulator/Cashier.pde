class Cashier {
  //FIELDS
  int cashierAmount;
  color colour;
  PVector pos;
  float diameter;
  boolean isAsleep;
  int cashierSpeed;

  //CONSTRUCTOR
  Cashier(boolean isAsleep, int cashierAmount, PVector p, float d) {
    this.isAsleep = isAsleep;
    this.cashierAmount = cashierAmount;
    this.colour = blue;  // Default color for awake cashier
    this.pos = p;
    this.diameter = d;
    this.cashierSpeed = 3; // Default speed
  }

  //METHODS
  void drawCashier() {
    if (this.isAsleep) {
      this.colour = purple;  // Purple if asleep
    } else {
      this.colour = blue;    // Blue if awake
    }
    fill(colour);
    stroke(colour);
    circle(pos.x, pos.y, diameter);
  }

  void increaseSpeed() {
    cashierSpeed++;
  }

  float timeToCheckOut() {
    return random(3 - (0.5 * cashierSpeed), 8 - (0.5 * cashierSpeed));
  }

  void checkIfIdle(float idleTime) {
    if (idleTime > 6) {  // If cashier has been idle for more than 6 seconds
      this.isAsleep = true;
    } else {
      this.isAsleep = false;
    }
  }
}

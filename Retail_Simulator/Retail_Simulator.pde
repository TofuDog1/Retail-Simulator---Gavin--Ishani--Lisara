import g4p_controls.*;

color red = color(255,0,0);       //Angry customer
color yellow = color(255,255,0);  //Normal customer
color blue = color(0,0,255);      //Normal cashier
color purple = color(255,0,255);  //Sleeping cashier

Cashier cashier;
float lastCustomerTime;

ArrayList<Cashier> cashiers = new ArrayList<Cashier>();
int numCashiers = 2;


void setup() {
  size(800,700);
  background(255,255,255);
  rect(50,550, 700,50);    //Counter
  createGUI();
  
  for(int i = 0; i < numCashiers; i++) {
    cashiers.add(new Cashier(new PVector(800*(i+1)/(numCashiers+1), 650), 50, false, millis()));
  }

}


void draw() {
  noFill();
  stroke(0);
  background(255,255,255);
  rect(50,550, 700,50);
  
  for(int i = 0; i < cashiers.size(); i++) {
    // Calculate idle time based on the last customer time
    float idleTime = (millis() - cashiers.get(i).lastCustomerTime) / 1000.0; // convert to seconds
   
    // Update cashier state based on idle time
    cashiers.get(i).checkIfIdle(idleTime);
   
    // Draw the cashier based on current state
    cashiers.get(i).drawCashier();
   
    // Simulates serving a customer every few seconds to reset idle time
    if (frameCount % 120 == 0) {  // Simulate customer every 120 frames (~2 seconds)
      cashiers.get(i).lastCustomerTime = millis(); // Reset idle timer
      cashiers.get(i).isAsleep = false;    // Wake up cashier if a customer arrives
    }
  
  }
 
}

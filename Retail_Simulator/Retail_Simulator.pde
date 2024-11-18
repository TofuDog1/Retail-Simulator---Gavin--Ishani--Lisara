import g4p_controls.*;

color red = color(255,0,0);       //Angry customer
color yellow = color(255,255,0);  //Normal customer
color blue = color(0,0,255);      //Normal cashier
color purple = color(255,0,255);  //Sleeping cashier

int diameter = 50;
ArrayList<Cashier> cashiers = new ArrayList<Cashier>();
int numCashiers = 2;     //no max for now, code max later
int cashierSpeed = 3;    //1 - 5 in the GUI
float lastCustomerTime;

float customerInflow = 2;  //0.1 - 10 in the GUI
int customerPatience = 4;  //1 - 5 in the GUI
int customerAggression = 1;  //1 - 5 in the GUI


void setup() {
  size(800,700);
  background(255,255,255);
  rect(50,550, 700,50);    //Counter
  createGUI();
  
  for(int i = 0; i < numCashiers; i++) {
    cashiers.add(new Cashier (new PVector (800*(i+1) / (numCashiers+1), 650), diameter, millis()));  //Adds cashiers for how many cashiers needed
  }

}


void draw() {
  noFill();
  stroke(0);
  background(255,255,255);
  rect(50,550, 700,50);
  
  int customerAddChance = int(random(0, (10.5-customerInflow)*60));  //Random chance of adding a customer every frame based off the inflow rate
  if(customerAddChance == 0){
    int cashierChosen = int(random(0,numCashiers));                  //Picking a random cashier (implement checking how long the line is for each cashier later)
    
    try{
      float customerAheadY = cashiers.get(cashierChosen).customersInLine.get( cashiers.get(cashierChosen).customersInLine.size()-1 ).pos.y;  //Getting the y coord of the customer ahead in line
      //cashiers.get(cashierChosen).customersInLine  gets the cashier and its customersinline arraylist
      //.get( cashiers.get(cashierChosen).customersInLine.size()-1 ).pos.y  sees how long the customersinline arraylist is and gets the y coordinate of the last element (customer ahead)
      if(customerAheadY >= 75){   //Doesn't draw a customer if the distance between the would be customer and the customer ahead of it is under 75
        cashiers.get(cashierChosen).customersInLine.add(new Customer( new PVector (cashiers.get(cashierChosen).pos.x, -diameter*0.5), diameter, customerPatience, customerAggression)); 
      }
    }
      
    catch(Exception e){
      cashiers.get(cashierChosen).customersInLine.add(new Customer( new PVector (cashiers.get(cashierChosen).pos.x, -diameter*0.5), diameter, customerPatience, customerAggression)); //Draws a customer if there is no customer ahead in line
    }
  }
  
  
  for(Cashier cash : cashiers) {
    // Calculate idle time based on the last customer time
    float idleTime = (millis() - cash.lastCustomerTime) / 1000.0; // convert to seconds
   
    // Update cashier state based on idle time
    cash.checkIfIdle(idleTime);
   
    // Draw the cashier based on current state
    cash.drawCashier();
   
    // Simulates serving a customer every few seconds to reset idle time
    if (frameCount % 120 == 0) {  // Simulate customer every 120 frames (~2 seconds)
      cash.lastCustomerTime = millis(); // Reset idle timer
      cash.isAsleep = false;    // Wake up cashier if a customer arrives
    }
    
    
    for(Customer cust : cash.customersInLine) {
      try{
        float customerAheadY = cash.customersInLine.get( cash.customersInLine.indexOf(cust)-1 ).pos.y;  //Getting the y coord of the customer ahead in line
        //cash.customersInLine.get  gets the cashier and its customersinline arraylist
        //.get( cash.customersInLine.indexOf(cust)-1 ).pos.y  gets the y coordinate of the element ahead of the customer (customer ahead in line)
        if(customerAheadY > cust.pos.y+75){
          cust.moveAhead();
        }
      }
      
      catch(Exception e){
        if(cust.pos.y <= 500){
          cust.moveAhead(); //Draws it at 500 if there is no customer ahead in line
          cash.checkOut(cust, cash.timeToCheckOut());
        }
      }
      
      cust.drawCustomer();  //Draws all the customers
    }
  }
 
}

//Features needed eventually
//Cashier checking the customers out
//Customers leave and move ahead in line
//Customers pick the cashier with the shortest line
//GUI affects the variables
//Live update the variables of each cashier/customer based off the GUI
//Cashiers can fall asleep
//Customers can fight the cashiers
//probably more

import g4p_controls.*;

color red = color(255,0,0);       // Angry customer
color yellow = color(255,255,0);  // Normal customer
color green = color(0,255,0);     // Happy customer
color blue = color(0,0,255);      // Normal cashier
color purple = color(155,0,255);  // Sleeping cashier

boolean paused = true;
int diameter = 50;
ArrayList<Cashier> cashiers = new ArrayList<Cashier>();
int numCashiers = 1;         // 1 - 7
int cashierSpeed = 3;        // 1 - 5
float lastCustomerTime;

float customerInflow = 2;    // 0.1 - 10.0
int customerPatience = 4;    // 1 - 5
int customerAggression = 1;  // 1 - 5


void setup() {
  size(800,700);
  background(228,228,228);
  fill(196,164,132);
  rect(50,550, 700,50);    // Counter
  createGUI();
  
  for(int i = 0; i < numCashiers; i++) {
    cashiers.add(new Cashier (new PVector (800*(i+1) / (numCashiers+1), 650), diameter, millis()));  // Adds cashiers for how many cashiers needed
  }

}

void draw() {
  if (paused == true) {
    fill(196,164,132);
    background(228,228,235);
    rect(50,550, 700,50);
    
    if (numCashiers != cashiers.size()) {   // If the amount of cashiers doesn't match with the amount in the GUI
      if (numCashiers > cashiers.size()) {  // More cashiers needed
        for (int i = 0; i < (numCashiers-cashiers.size()); i++) {  // Adds cashiers for how many cashiers needed
          cashiers.add(new Cashier (new PVector (0, 650), diameter, millis()));
        }
      }
      
      else {  //Too many cashiers
        for (int i = 0; i < (cashiers.size()-numCashiers); i++) {  // Removes cashiers for how many cashiers needed
          cashiers.remove(cashiers.size()-1);
        }
      }
        
      for (int i = 0; i < cashiers.size(); i++) {
        cashiers.get(i).pos.x = 800*(i+1) / (numCashiers+1);  // Updates all the x positions for the cashiers
      }
    }
    
    
    for (Cashier cash : cashiers) {
      // Updates all the cashier variables based off the GUI
      cash.cashierUpdate();
     
      // Checks if the cashier is falling asleep
      cash.checkIfIdle();
      
      // Generates customers for every cashier
      cash.generateCustomer();
      
      // Draw the cashier based on current state
      cash.drawCashier();
      
      IntList customersDelete = new IntList();
      IntList customersOffScreen = new IntList();
        
      for (Customer cust : cash.customersInLine) {
        int custIndex = cash.customersInLine.indexOf(cust);
 
        if (custIndex != 0) {  // If there is a customer ahead in line
          float customerAheadY = cash.customersInLine.get( custIndex-1 ).pos.y;  // Getting the y coord of the customer ahead in line
          
          if (customerAheadY > cust.pos.y + diameter*1.5 && cust.leaving == false) {  // Moves forward if the distance between it and the customer ahead of it is over/equal to 1.5 times the diameter and if it's not leaving the line
            cust.moveAhead();
          }
          else{
            cust.wait(cash.customersInLine, cash.customersLeaving, custIndex);
          }
        }
        
        else {    // If there isn't a customer ahead in line
          if (cust.pos.y < 500 && cust.checkedOut == false) {
            cust.moveAhead();  // Moves forward if there is no customer ahead in line and it hasn't reached the cashier yet
          }
          
          else if (cust.pos.y >= 500 && cust.checkedOut == false) {  // Gets checked out if customer reaches the cashier
            cust.timeArrivedAtCashier = millis();
            cust.checkingOutTime = cash.timeToCheckOut();
            cust.colour = green;  // Customer becomes happy when served
            cust.checkOut(millis());
          }
          
          else if (cust.checkedOut == true && cust.leaving == false) {  // Keeps checking if the customer is done checking out
            cust.checkOut(millis());
          }
        }
        
        if (cust.leaving == true) {  // If the customer is done checking out and is leaving
          if (cust.pos.x > cash.pos.x-diameter) {
              cust.leaveLeft();  // Customer moves leftward to leave the line
          }
          else {  // Customer behind in line can move forward if the customer in the front of the line is leaving
            cash.customersLeaving.add(cust);
            customersDelete.append(custIndex);
          }
        }
       
        cust.customerUpdate();          // Updates all the customer attributes with the GUI
        cust.drawCustomer(cash.pos.x);  // Draws all the customers  
      }

      for (Customer cust : cash.customersLeaving) {
        cust.leftAmount = diameter;
        cust.leaveUp();                 // Customer moves upward to leave
        cust.customerUpdate();          // Updates all the customer attributes with the GUI
        cust.drawCustomer(cash.pos.x);  // Draws all the customers leaving
        
        if (cust.pos.y <= -diameter/2) {  // Delete the customer once it reaches the end of the screen
          customersOffScreen.append( cash.customersLeaving.indexOf(cust) );
        }
      }
      
      // Deleting the customers after doing all of the functions prevents errors
      for (int index : customersDelete) {
        cash.customersInLine.remove( cash.customersInLine.get(index) );
      }
      
      for (int index : customersOffScreen) {
        cash.customersLeaving.remove( cash.customersLeaving.get(index) );
      }
      
    }
  }
}

//Features needed eventually
//Customers pick the cashier with the shortest line maybe  (done?)
//Customers can fight the cashiers
//Presets  (done?)
//Replace aggr with speed??
//probably more

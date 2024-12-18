/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void GUI_draw(PApplet appc, GWinData data) { //_CODE_:GUI:957073:
  appc.background(230);
} //_CODE_:GUI:957073:

public void Pause_Click(GButton source, GEvent event) { //_CODE_:Pause:413731:
  if(paused == true){
    Pause.setText("Unpause");
    Pause.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  } 
  else {
    Pause.setText("Pause"); 
    Pause.setLocalColorScheme(GCScheme.RED_SCHEME);
  }
  paused = !paused;
} //_CODE_:Pause:413731:

public void Clear_Click(GButton source, GEvent event) { //_CODE_:Clear:949067:
  for (Cashier cashier : cashiers) {
    cashier.customersInLine.clear();
    cashier.customersLeaving.clear();
    //draw
  }
} //_CODE_:Clear:949067:

public void CustomerInflowSlider(GSlider source, GEvent event) { //_CODE_:CustomerInflow:343922:
  customerInflow = CustomerInflow.getValueF();
} //_CODE_:CustomerInflow:343922:

public void CashierSpeedSlider(GSlider source, GEvent event) { //_CODE_:CashierSpeed:299747:
  cashierSpeed = CashierSpeed.getValueI();
} //_CODE_:CashierSpeed:299747:

public void CustomerPatienceSlider(GSlider source, GEvent event) { //_CODE_:CustomerPatience:911959:
  customerPatience = CustomerPatience.getValueI();
} //_CODE_:CustomerPatience:911959:

public void CustomerSpeedSlider(GSlider source, GEvent event) { //_CODE_:CustomerSpeed:271313:
  customerSpeed = CustomerSpeed.getValueI();
} //_CODE_:CustomerSpeed:271313:

public void CashierAmountText(GTextField source, GEvent event) { //_CODE_:CashierAmount:904763:
  int cashierAmount = int(CashierAmount.getText());
  if(cashierAmount > 0 && cashierAmount <= 7){
    numCashiers = cashierAmount;
  }
  else if(cashierAmount > 7){
    numCashiers = 7;
  }
} //_CODE_:CashierAmount:904763:

public void PresetsDropdown(GDropList source, GEvent event) { //_CODE_:Presets:409116:
  String selectedPreset = source.getSelectedText();
  
  switch (selectedPreset) {
    case "Black Friday":
    customerPatience = 1;
    customerSpeed = 10;
    cashierSpeed = 5;
    customerInflow = 10;
    break;
  
    case "Slow Tuesday":
    customerPatience = 5;
    customerSpeed = 1;
    cashierSpeed = 2;
    customerInflow = 0.01;
    break;
  
    case "Normal Day":
    customerPatience = 3;
    customerSpeed = 5;
    cashierSpeed = 3;
    customerInflow = 5;
    break;
    
    case "Zombie Apocalypse":
    numCashiers = 7;
    customerPatience = 5;
    customerSpeed = 1;
    cashierSpeed = 1;
    customerInflow = 10;
    break;
  }
  
  CustomerPatience.setValue(customerPatience);
  CustomerSpeed.setValue(customerSpeed);
  CashierSpeed.setValue(cashierSpeed);
  CustomerInflow.setValue(customerInflow);
} //_CODE_:Presets:409116:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  GUI = GWindow.getWindow(this, "Controls", 0, 0, 440, 300, JAVA2D);
  GUI.noLoop();
  GUI.setActionOnClose(G4P.KEEP_OPEN);
  GUI.addDrawHandler(this, "GUI_draw");
  Pause = new GButton(GUI, 240, 250, 80, 30);
  Pause.setText("Pause");
  Pause.setLocalColorScheme(GCScheme.RED_SCHEME);
  Pause.addEventHandler(this, "Pause_Click");
  Clear = new GButton(GUI, 340, 250, 80, 30);
  Clear.setText("Clear");
  Clear.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
  Clear.addEventHandler(this, "Clear_Click");
  CustomerInflow = new GSlider(GUI, 20, 44, 100, 40, 10.0);
  CustomerInflow.setLimits(2.0, 0.01, 10.0);
  CustomerInflow.setNumberFormat(G4P.DECIMAL, 2);
  CustomerInflow.setOpaque(false);
  CustomerInflow.addEventHandler(this, "CustomerInflowSlider");
  CustomerSliderLabel = new GLabel(GUI, 20, 20, 100, 20);
  CustomerSliderLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  CustomerSliderLabel.setText("Customer Inflow");
  CustomerSliderLabel.setOpaque(false);
  CashierLabel = new GLabel(GUI, 170, 100, 100, 20);
  CashierLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  CashierLabel.setText("Cashier Speed");
  CashierLabel.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  CashierLabel.setOpaque(false);
  CashierSpeed = new GSlider(GUI, 170, 120, 100, 50, 10.0);
  CashierSpeed.setShowValue(true);
  CashierSpeed.setLimits(3, 1, 5);
  CashierSpeed.setNbrTicks(5);
  CashierSpeed.setShowTicks(true);
  CashierSpeed.setNumberFormat(G4P.INTEGER, 0);
  CashierSpeed.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
  CashierSpeed.setOpaque(false);
  CashierSpeed.addEventHandler(this, "CashierSpeedSlider");
  CustomerPatience = new GSlider(GUI, 170, 39, 100, 50, 10.0);
  CustomerPatience.setShowValue(true);
  CustomerPatience.setLimits(4, 1, 5);
  CustomerPatience.setNbrTicks(5);
  CustomerPatience.setShowTicks(true);
  CustomerPatience.setNumberFormat(G4P.INTEGER, 0);
  CustomerPatience.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  CustomerPatience.setOpaque(false);
  CustomerPatience.addEventHandler(this, "CustomerPatienceSlider");
  CustomerSpeed = new GSlider(GUI, 320, 39, 100, 50, 10.0);
  CustomerSpeed.setShowValue(true);
  CustomerSpeed.setLimits(5.0, 1.0, 10.0);
  CustomerSpeed.setNbrTicks(5);
  CustomerSpeed.setNumberFormat(G4P.DECIMAL, 0);
  CustomerSpeed.setLocalColorScheme(GCScheme.RED_SCHEME);
  CustomerSpeed.setOpaque(false);
  CustomerSpeed.addEventHandler(this, "CustomerSpeedSlider");
  CustomerPatienceLabel = new GLabel(GUI, 160, 20, 120, 20);
  CustomerPatienceLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  CustomerPatienceLabel.setText("Customer Patience");
  CustomerPatienceLabel.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  CustomerPatienceLabel.setOpaque(false);
  CustomerSpeedLabel = new GLabel(GUI, 305, 20, 130, 20);
  CustomerSpeedLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  CustomerSpeedLabel.setText("Customer Speed");
  CustomerSpeedLabel.setLocalColorScheme(GCScheme.RED_SCHEME);
  CustomerSpeedLabel.setOpaque(false);
  CashierAmountLabel = new GLabel(GUI, 20, 100, 100, 20);
  CashierAmountLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  CashierAmountLabel.setText("Cashier Amount");
  CashierAmountLabel.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  CashierAmountLabel.setOpaque(false);
  CashierAmount = new GTextField(GUI, 20, 130, 100, 30, G4P.SCROLLBARS_NONE);
  CashierAmount.setText("1");
  CashierAmount.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  CashierAmount.setOpaque(true);
  CashierAmount.addEventHandler(this, "CashierAmountText");
  Presets = new GDropList(GUI, 325, 120, 90, 120, 5, 10);
  Presets.setItems(loadStrings("list_409116"), 0);
  Presets.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  Presets.addEventHandler(this, "PresetsDropdown");
  PresetsLabel = new GLabel(GUI, 330, 100, 80, 20);
  PresetsLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  PresetsLabel.setText("Presets");
  PresetsLabel.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  PresetsLabel.setOpaque(false);
  GUI.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow GUI;
GButton Pause; 
GButton Clear; 
GSlider CustomerInflow; 
GLabel CustomerSliderLabel; 
GLabel CashierLabel; 
GSlider CashierSpeed; 
GSlider CustomerPatience; 
GSlider CustomerSpeed; 
GLabel CustomerPatienceLabel; 
GLabel CustomerSpeedLabel; 
GLabel CashierAmountLabel; 
GTextField CashierAmount; 
GDropList Presets; 
GLabel PresetsLabel; 

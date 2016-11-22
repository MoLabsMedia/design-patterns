// --------------
// CREDIT: Derek Banas
// URL: http://www.newthinktank.com/2012/10/state-design-pattern-tutorial/
// --------------

public interface ATMState {
  // Different states expected:
    // HasCard
    // NoCard
    // HasPin
    // NoCash
  void insertCard();
  void insertPin(int pinEntered);
  void requestCash(int cashToWithdraw);
  void ejectCard();
}
public class HasCard implements ATMState {
  ATMMachine atmMachine;
  public HasCard(ATMMachine newATMMachine){
    atmMachine = newATMMachine;
  }
  public void insertCard() {
    System.out.println("You can only insert one card at a time");
  }
  public void ejectCard() {
    System.out.println("Your card is ejected");
    atmMachine.setATMState(atmMachine.getNoCardState());
  }
  public void requestCash(int cashToWithdraw) {
    System.out.println("You have not entered your PIN");
  }
  public void insertPin(int pinEntered) {
    if(pinEntered == 1234){
      System.out.println("You entered the correct PIN");
      atmMachine.correctPinEntered = true;
      atmMachine.setATMState(atmMachine.getHasPin());
    } else {
      System.out.println("You entered the wrong PIN");
      atmMachine.correctPinEntered = false;
      System.out.println("Your card is ejected");
      atmMachine.setATMState(atmMachine.getNoCardState());
    }
  }
}
public class NoCard implements ATMState {
  ATMMachine atmMachine;
  public NoCard(ATMMachine newATMMachine){
    atmMachine = newATMMachine;
  }
  public void insertCard() {
    System.out.println("Please enter your pin");
    atmMachine.setATMState(atmMachine.getYesCardState());
  }
  public void ejectCard() {
    System.out.println("You didn't enter a card");
  }
  public void requestCash(int cashToWithdraw) {
    System.out.println("You have not entered your card");
  }
  public void insertPin(int pinEntered) {
    System.out.println("You have not entered your card");
  }
}
public class HasPin implements ATMState {
  ATMMachine atmMachine;
  public HasPin(ATMMachine newATMMachine){
    atmMachine = newATMMachine;
  }
  public void insertCard() {
    System.out.println("You already entered a card");
  }
  public void ejectCard() {
    System.out.println("Your card is ejected");
    atmMachine.setATMState(atmMachine.getNoCardState());
  }
  public void requestCash(int cashToWithdraw) {
    if(cashToWithdraw > atmMachine.cashInMachine){
      System.out.println("You don't have that much cash available");
      System.out.println("Your card is ejected");
      atmMachine.setATMState(atmMachine.getNoCardState());
    } else {
      System.out.println(cashToWithdraw + " is provided by the machine");
      atmMachine.setCashInMachine(atmMachine.cashInMachine - cashToWithdraw);
      System.out.println("Your card is ejected");
      atmMachine.setATMState(atmMachine.getNoCardState());
      if(atmMachine.cashInMachine <= 0){
        atmMachine.setATMState(atmMachine.getNoCashState());
      }
    }
  }
  public void insertPin(int pinEntered) {
    System.out.println("You already entered a PIN");
  }
}
public class NoCash implements ATMState {
  ATMMachine atmMachine;
  public NoCash(ATMMachine newATMMachine){
    atmMachine = newATMMachine;
  }
  public void insertCard() {
    System.out.println("We don't have any money");
    System.out.println("Your card is ejected");
  }
  public void ejectCard() {
    System.out.println("We don't have any money");
    System.out.println("There is no card to eject");
  }
  public void requestCash(int cashToWithdraw) {
    System.out.println("We don't have any money");
  }
  public void insertPin(int pinEntered) {
    System.out.println("We don't have any money");
  }
}

public class ATMMachine {
  ATMState _atmState;
  int _cashInMachine = 2000;

  ATMState hasCard;
  ATMState noCard;
  ATMState hasCorrectPin;
  ATMState atmOutOfMoney;

  boolean correctPinEntered = false;
  public ATMMachine(){
    hasCard = new HasCard(this);
    noCard = new NoCard(this);
    hasCorrectPin = new HasPin(this);
    atmOutOfMoney = new NoCash(this);

    _atmState = noCard;

    if(_cashInMachine < 0){
      _atmState = atmOutOfMoney;
    }
  }
  void setATMState(ATMState newATMState){
    _atmState = newATMState;
  }
  public void setCashInMachine(int newCashInMachine){
    _cashInMachine = newCashInMachine;
  }
  public void insertCard() {
    _atmState.insertCard();
  }
  public void ejectCard() {
    _atmState.ejectCard();
  }
  public void requestCash(int cashToWithdraw) {
    _atmState.requestCash(cashToWithdraw);
  }
  public void insertPin(int pinEntered){
    _atmState.insertPin(pinEntered);
  }

  public ATMState getYesCardState() { return hasCard; }
  public ATMState getNoCardState() { return noCard; }
  public ATMState getHasPin() { return hasCorrectPin; }
  public ATMState getNoCashState() { return atmOutOfMoney; }
}

public class TestATMMachine {
  public static void main(String[] args){
    ATMMachine atmMachine = new ATMMachine();

    atmMachine.insertCard();
    atmMachine.ejectCard();
    atmMachine.insertCard();
    atmMachine.insertPin(1234);
    atmMachine.requestCash(2000);
    atmMachine.insertCard();
    atmMachine.insertPin(1234);
  }
}

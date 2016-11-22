// --------------
// CREDIT: sourcemaking.com
// URL: https://sourcemaking.com/design_patterns/state/cpp/1
// --------------

#include <iostream>

using namespace std;

class Machine {
  class State *current;
  public:
    Machine();
    void setCurrent(State *s) {
      current = s;
    }
    void on();
    void off();
};
Machine::Machine() {
  current = new OFF();
  cout << '\n';
}
void Machine::on() {
  current->on(this);
}
void Machine::off() {
  current->off(this);
}

class State {
  public:
    virtual void on(Machine *m) {}
    virtual void off(Machine *m) {}
};
class StateOn: public State {
  public:
    StateOn() {
      cout << "   ON-ctor ";
    };
    ~StateOn() {
      cout << "   dtor-ON\n";
    };
    void off(Machine *m);
};
class StateOff: public State {
  public:
    StateOff() {
      cout << "   OFF-ctor ";
    };
    ~StateOff() {
      cout << "   dtor-OFF\n";
    };
    void on(Machine *m);
};
void StateOn::off(Machine *m) {
  cout << "   going from ON to OFF";
  m->setCurrent(new StateOff());
  delete this;
}
void StateOff::on(Machine *m) {
  cout << "   going from OFF to ON";
  m->setCurrent(new StateOn());
  delete this;
}

int main() {
  void(Machine:: *ptrs[])() =  {
    Machine::off, 
    Machine::on
  };
  Machine fsm;
  int num;
  while (1) {
    cout << "Enter 0/1: ";
    cin >> num;
    (fsm. *ptrs[num])();
  }
}

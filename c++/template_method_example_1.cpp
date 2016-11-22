// --------------
// CREDIT: sourcemaking.com
// URL: https://sourcemaking.com/design_patterns/template_method/cpp/1
// --------------

#include <iostream>

using namespace std;

class Base {
  void a() {
    cout << "a  ";
  }
  void c() {
    cout << "c  ";
  }
  void e() {
    cout << "e  ";
  }
  // 2. Steps requiring peculiar implementations are "placeholders" in base class
  virtual void ph1() = 0;
  virtual void ph2() = 0;
public:
  // 1. Standardize the skeleton of an algorithm in a base class "template method"
  void execute() {
    a();
    ph1();
    c();
    ph2();
    e();
  }
};

class One : public Base {
   void ph1() {
    cout << "b  ";
  }
   void ph2() {
    cout << "d  ";
  }
};

class Two : public Base {
   void ph1() {
    cout << "2  ";
  }
   void ph2() {
    cout << "4  ";
  }
};

int main() {
  Base *array[] =  {
    &One(), 
    &Two()
  };
  for (int i = 0; i < 2; i++) {
    array[i]->execute();
    cout << '\n';
  }
}

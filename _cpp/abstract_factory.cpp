#define THE

#include <iostream>
using namespace std;

class AbstractProduct {};
class ConcreteProductA1 : public AbstractProduct {};
class ConcreteProductA2 : public AbstractProduct {};
class ConcreteProductB1 : public AbstractProduct {};
class ConcreteProductB2 : public AbstractProduct {};

class AbstractFactory {
  public:
    virtual AbstractProduct *build_a() = 0;
    virtual AbstractProduct *build_b() = 0;
};
class ConcreteFactoryA : public AbstractFactory {
  public:
    AbstractProduct *build_a () {
      return new ConcreteProductA1;
    }
    AbstractProduct *build_b () {
      return new ConcreteProductB1;
    }
};
class ConcreteFactoryB : public AbstractFactory {
  public:
    AbstractProduct *build_a () {
      return new ConcreteProductA2;
    }
    AbstractProduct *build_b () {
      return new ConcreteProductB2;
    }
};

class Order {
  private:
    AbstractFactory *_factory;

  public:
    Order ( AbstractFactory *f ) {
      _factory = f;
    }
    void process () {
      // _factory->process();
    }
};

int main () {
  AbstractFactory *factory;

  #ifdef THE
    factory = new ConcreteFactoryA;
  #else
    factory = new ConcreteFactoryB;
  #endif

  Order *o = new Order( factory );
  o->process();
}

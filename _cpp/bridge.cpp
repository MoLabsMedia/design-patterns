#define THE

#include <iostream>
using namespace std;

class AbstractImplementor {
  public:
    virtual void implement() = 0;
};
class ConcreteImplementorA : public AbstractImplementor {
  public:
    void implement() {
      cout << "implement from: ConcreteImplementorA" << endl;
    } 
};
class ConcreteImplementorB : public AbstractImplementor {
  public:
    void implement() {
      cout << "implement from: ConcreteImplementorB" << endl;
    } 
};

class AbstractExecutor {
  protected:
    AbstractImplementor *_implementor;

  public:
    AbstractExecutor( AbstractImplementor *implementor ) {
      _implementor = implementor;
    }
    void implement() {
      _implementor->implement();
    } 
};
class ConcreteExecutorA : public AbstractExecutor {
  public:
    ConcreteExecutorA( AbstractImplementor *implementor ) : AbstractExecutor( implementor ) {}
};
class ConcreteExecutorB : public AbstractExecutor {
  public:
    ConcreteExecutorB( AbstractImplementor *implementor ) : AbstractExecutor( implementor ) {}
};

int main() {
  ConcreteImplementorA *concrete_implementor_a = new ConcreteImplementorA;
  ConcreteExecutorA *concrete_executor_a = new ConcreteExecutorA( concrete_implementor_a );
  concrete_executor_a->implement();

  ConcreteImplementorB *concrete_implementor_b = new ConcreteImplementorB;
  ConcreteExecutorB *concrete_executor_b = new ConcreteExecutorB( concrete_implementor_b );
  concrete_executor_b->implement();
}

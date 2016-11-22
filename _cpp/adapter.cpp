class Adaptee {
  public:
    void doSomething() {}
};

class Interface {
  public:
    virtual void process() = 0;
};
class Adapter : public Interface {
  private:  
    Adaptee *_adaptee;

  public:
    Adapter( Adaptee *adaptee ) {
      _adaptee = adaptee;
    }
    void process() {
      _adaptee->doSomething();
    } 
};

int main() {
  Adaptee *adaptee = new Adaptee;
  Adapter *adapter = new Adapter( adaptee );
  adapter->process();
}

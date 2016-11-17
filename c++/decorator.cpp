// --------------
// CREDIT : sourcemaking.com
// URL : https://sourcemaking.com/design_patterns/decorator/cpp/1
// --------------

// Discussion. Use aggregation instead of inheritance to implement embellishments to a "core" object. Client can dynamically compose permutations, instead of the architect statically wielding multiple inheritance.
class I {
  public:
    virtual ~I(){}
    virtual void process() = 0;
};
class A : public I {
  public:
    ~A() {
      cout << "A dtor" << '\n';
    }
    /*virtual*/
    void process() {
      cout << 'A';
    }
};
class D : public I {
  public:
    D(I *inner) {
      m_wrappee = inner;
    }
    ~D() {
      delete m_wrappee;
    }
    /*virtual*/
    void process() {
      m_wrappee->process();
    }
  private:
    I *m_wrappee;
};
class X : public D {
  public:
    X(I *core) : D(core){}
    ~X() {
      cout << "X dtor" << "   ";
    }
    /*virtual*/
    void process() {
      D::process();
      cout << 'X';
    }
};
class Y : public D {
  public:
    Y(I *core) : D(core){}
    ~Y() {
      cout << "Y dtor" << "   ";
    }
    /*virtual*/
    void process() {
      D::process();
      cout << 'Y';
    }
};
class Z : public D {
  public:
    Z(I *core) : D(core){}
    ~Z() {
      cout << "Z dtor" << "   ";
    }
    /*virtual*/
    void process() {
      D::process();
      cout << 'Z';
    }
};

int main() { 
  I *anX = new X(new A);
  I *anXY = new Y(new X(new A));
  I *anXYZ = new Z(new Y(new X(new A)));
  anX->process();
  cout << '\n';
  anXY->process();
  cout << '\n';
  anXYZ->process();
  cout << '\n';
  delete anX;
  delete anXY;
  delete anXYZ;
}

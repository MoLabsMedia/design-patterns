#define THE

#include <iostream>
#include <algorithm>
#include <string>
#include <array>
#include <iterator>

using namespace std;

class Part {};
class Head : public Part {};
class Body : public Part {};
class Tail : public Part {};

class Product {
  protected:
    array<Part> *_parts;

  public:
    void addPart( Part *part ) {
      switch( part ) {
        case 'head' :
          // _parts.push new Head();
        case 'body' :
          // _parts.push new Body();
        case 'tail' :
          // _parts.push new Tail();
        default :
          cout << 'there is no such part.' << endl;
      }
    }
    void display() {
      return _parts;
    }
};

class AbstractBuilder {
  public:
    virtual void addPart() = 0;
};
class ConcreteBuilder : public AbstractBuilder {
  protected:
    Product *_product;

  public:
    ConcreteBuilder( Product *product ) {
      _product = product;
    }
    void addPart( Part *part ) {
      _product->addPart( part );
    } 
    Product getProduct() {
      return _product;
    } 
};

class Assembler {
  protected:
    AbstractBuilder *_builder;

  public:
    Assembler( AbstractBuilder *builder ) {
      _builder = builder;
    }
    void assemble( Part *parts[] ) {
      for( int i = 0; i < parts->count(); ++i ) {
        _builder->addPart( parts[i] );
      }
    }
};


int main {
  AbstractBuilder *concrete_builder = new ConcreteBuilder;
  Assembler *assembler = new Assembler( concrete_builder );
  string *parts[] = { 'head', 'body', 'tail' };
  assembler->assemble( parts );
  Product *product = concrete_builder->getProduct();
  cout << product->display() << endl;
}

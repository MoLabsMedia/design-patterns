// --------------
// CREDIT: sourcemaking.com
// URL: https://sourcemaking.com/design_patterns/abstract_factory/cpp/2
// --------------

#include <iostream.h>

class Shape {
  public:
    Shape() { _id = _total++; }
    virtual void draw() = 0;
  protected:
    int _id;
    static int _total;
};
int Shape::_total = 0;
class Circle : public Shape {
  public:
    void draw() { cout << "circle " << _id << ": draw" << endl; }
};
class Square : public Shape {
  public:
    void draw() { cout << "square " << _id << ": draw" << endl; }
};
class Ellipse : public Shape {
  public:
    void draw() { cout << "ellipse " << _id << ": draw" << endl; }
};
class Rectangle : public Shape {
  public:
    void draw() { cout << "rectangle " << _id << ": draw" << endl; }
};

class Factory {
  public:
    virtual Shape* createCurvedInstance() = 0;
    virtual Shape* createStraightInstance() = 0;
};
class SimpleShapeFactory : public Factory {
  public:
    Shape* createCurvedInstance() { return new Circle; }
    Shape* createStraightInstance() { return new Square; }
};
class RobustShapeFactory : public Factory {
  public:
    Shape* createCurvedInstance() { return new Ellipse; }
    Shape* createStraightInstance() { return new Rectangle; }
};

int main() {
  #ifdef SIMPLE
    Factory* factory = new SimpleShapeFactory;
  #elif ROBUST
    Factory* factory = new RobustShapeFactory;
  #endif

  Shape* shapes[3];
  shapes[0] = factory->createCurvedInstance();
  shapes[1] = factory->createStraightInstance();
  shapes[2] = factory->createCurvedInstance();

  for (int i=0; i < 3; i++) {
    shapes[i]->draw();
  }
}

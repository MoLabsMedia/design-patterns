// --------------
// CREDIT: sourcemaking.com
// URL: https://sourcemaking.com/design_patterns/decorator/cpp/3
// --------------

#include <iostream>
#include <string>
using namespace std;

class Interface
{
  public:
    virtual ~Interface(){}
    virtual void write(string &) = 0;
    virtual void read(string &) = 0;
};

class Core: public Interface
{
  public:
    ~Core()
    {
        cout << "dtor-Core\n";
    }
     /*virtual*/void write(string &b)
    {
        b += "MESSAGE|";
    }
     /*virtual*/void read(string &);
};

class Decorator: public Interface
{
    Interface *inner;
  public:
    Decorator(Interface *c)
    {
        inner = c;
    }
    ~Decorator()
    {
        delete inner;
    }
     /*virtual*/void write(string &b)
    {
        inner->write(b);
    }
     /*virtual*/void read(string &b)
    {
        inner->read(b);
    }
};

class Wrapper: public Decorator
{
    string forward, backward;
  public:
    Wrapper(Interface *c, string str): Decorator(c)
    {
        forward = str;
        string::reverse_iterator it;
        it = str.rbegin();
        for (; it != str.rend(); ++it)
          backward +=  *it;
    }
    ~Wrapper()
    {
        cout << "dtor-" << forward << "  ";
    }
    void write(string &);
    void read(string &);
};

int main()
{
  Interface *object = new Wrapper(new Wrapper(new Wrapper(new Core(), "123"), 
    "abc"), "987");
  string buf;
  object->write(buf);
  cout << "main: " << buf << endl;
  object->read(buf);
  delete object;
}

// Output

// main: 987]abc]123]MESSAGE|321]cba]789]
// Wrapper: 987
// Wrapper: abc
// Wrapper: 123
// Core: MESSAGE
// Wrapper: 321
// Wrapper: cba
// Wrapper: 789
// dtor-987  dtor-abc  dtor-123  dtor-Core

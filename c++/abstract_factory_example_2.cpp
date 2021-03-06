// --------------
// CREDIT: sourcemaking.com
// URL: https://sourcemaking.com/design_patterns/abstract_factory/cpp/2
// --------------

#include <iostream>

#define LINUX

using namespace std;

class Widget {
  public:
    virtual void draw() = 0;
};
class LinuxButton : public Widget {
  public:
    void draw() {}
};
class LinuxMenu : public Widget {
  public:
    void draw() {}
};

class WindowsButton : public Widget {
  public:
    void draw() {}
};
class WindowsMenu : public Widget {
  public:
    void draw() {}
};

class Factory {
  public:
    virtual Widget *create_button() = 0;
    virtual Widget *create_menu() = 0;
};
class LinuxFactory : public Factory {
  public:
    Widget *create_button() {
      return new LinuxButton;
    }
    Widget *create_menu() {
      return new LinuxMenu;
    }
};
class WindowsFactory : public Factory {
  public:
    Widget *create_button() {
      return new WindowsButton;
    }
    Widget *create_menu() {
      return new WindowsMenu;
    }
};

class Client {
  private:
    Factory *factory;

  public:
    Client( Factory *f ) {
      factory = f;
    }

    void draw() {}

    void display_window_one() {
      Widget *w[] = {
        factory->create_button(),
        factory->create_menu()
      };
      w[0]->draw();
      w[1]->draw();
    }

    void display_window_two() {
      Widget *w[] = {
        factory->create_menu(),
        factory->create_button()
      };
      w[0]->draw();
      w[1]->draw();
    }
};

int main() {
  Factory *factory;
  #ifdef LINUX
    factory = new LinuxFactory;
  #else
    factory = new WindowsFactory;
  #endif

  Client *c = new Client( factory );
  c->draw();
  cout << "something and something else " << endl;
}

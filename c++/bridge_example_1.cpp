// --------------
// CREDIT: sourcemaking.com
// URL: https://sourcemaking.com/design_patterns/bridge/cpp/1
// --------------

#include <iostream.h>
#include <iomanip.h>
#include <string.h>

class TimeImp {
  protected:
    int _hr, _min;

  public:
    TimeImp(int hr, int min) {
      _hr = hr;
      _min = min;
    }
    virtual void tell() { cout << "time is " << setw(2) << setfill(48) << _hr << _min << endl; }
};
class CivilianTimeImp : public TimeImp {
  protected:
    char _whichM[4];

  public:
    CivilianTimeImp(int hr, int min, int pm) : TimeImp(hr, min) {
      if (pm)
        strcpy(_whichM, " PM");
      else
        strcpy(_whichM, " AM");
    }
    void tell() { cout << "time is " << _hr << ":" << _min << _whichM << endl; }
};
class ZuluTimeImp : public TimeImp {
  protected:
    char _zone[30];

  public:
    ZuluTimeImp(int hr, int min, int zone): TimeImp(hr, min) {
      if (zone == 5)
        strcpy(_zone, " Eastern Standard Time");
      else if (zone == 6)
        strcpy(_zone, " Central Standard Time");
    }
    void tell() { cout << "time is " << setw(2) << setfill(48) << _hr << _min << _zone << endl; }
};

class Time {
  protected:
    TimeImp *_imp;

  public:
    Time(){}
    Time(int hr, int min) {
      _imp = new TimeImp(hr, min);
    }
    virtual void tell() { _imp->tell(); }
};
class CivilianTime : public Time {
  public:
    CivilianTime(int hr, int min, int pm) { _imp = new CivilianTimeImp(hr, min, pm); }
};
class ZuluTime : public Time {
  public:
    ZuluTime(int hr, int min, int zone) { _imp = new ZuluTimeImp(hr, min, zone); }
};

int main() {
  Time *times[3];
  times[0] = new Time(14, 30);
  times[1] = new CivilianTime(2, 30, 1);
  times[2] = new ZuluTime(14, 30, 6);
  for (int i = 0; i < 3; i++) {
    times[i]->tell();
  }
}

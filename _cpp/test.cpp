#include <iostream>
#include <array>
#include <string>

using namespace std;

int aLength( int obj[] ) {
  return sizeof( obj )/sizeof( *obj );
}

int main() {
  int num[] = { 1,2,3 };
  cout << aLength( num ) << endl;
}


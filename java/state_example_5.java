// --------------
// CREDIT: sourcemaking.com
// URL: https://sourcemaking.com/design_patterns/state/java/6
// --------------

import java.io.*;

class Chain {
  private int _state;

  public Chain() { 
    _state = 0; 
  }
  public void pull() {
    if ( _state == 0 ) {
      _state = 1;
      System.out.println( " low speed" );
    } else if ( _state == 1 ) {
      _state = 2;
      System.out.println( " medium speed" );
    } else if ( _state == 2 ) {
      _state = 3;
      System.out.println( " high speed" );
    } else {
      _state = 0;
      System.out.println( " turning off" );
    }   
  }   
}

public class StateDisc {
  public static void main( String[] args ) throws IOException {
    InputStreamReader is = new InputStreamReader( System.in );
    int ch;
    Chain chain = new Chain();
    while ( true ) {
      System.out.print( "Press 'Enter'" );
      ch = is.read(); 
      chain.pull();
    }   
  }   
}

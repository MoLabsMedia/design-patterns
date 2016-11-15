// --------------
// CREDIT: sourcemaking.com
// URL: https://sourcemaking.com/design_patterns/state/java/1
// --------------

// Before: 3-speed ceiling fan state machine
// Not good: unwieldy "case" statement
class CeilingFanPullChain {
  private int m_current_state;

  public CeilingFanPullChain() {
    m_current_state = 0;
  }
  public void pull() {
    if ( m_current_state == 0 ) {
      m_current_state = 1;
      System.out.println( "   low speed" );
    }
    else if ( m_current_state == 1 ) {
      m_current_state = 2;
      System.out.println( "   medium speed" );
    }
    else if ( m_current_state == 2 ) {
      m_current_state = 3;
      System.out.println( "   high speed" );
    }
    else {
      m_current_state = 0;
      System.out.println( "   turning off" );
    }
  }
}

public class StateDemo {
  public static void main( String[] args ) {
    CeilingFanPullChain chain = new CeilingFanPullChain();
    while ( true ) {
      System.out.print( "Press " );
      get_line();
      chain.pull();
    }
  }
  static String get_line() {
    BufferedReader in = new BufferedReader( new InputStreamReader(System.in ))
      ;
    String line = null;
    try {
      line = in.readLine();
    }
    catch ( IOException ex ) {
      ex.printStackTrace();
    }
    return line;
  }
}

// Output:
// Press 
//    low speed
// Press 
//    medium speed
// Press 
//    high speed
// Press 
//    turning off
// Press 
//    low speed
// Press 
//    medium speed
// Press 
//    high speed
// Press 
//    turning off



// After: The CeilingFanPullChain class is now a wrapper that delegates to its m_current_state reference. Each clause from the "before" case statement is now captured in a State derived class.
// For this simple domain, the State pattern is probably over-kill.
class CeilingFanPullChain {
  private State m_current_state;

  public CeilingFanPullChain() {
    m_current_state = new Off();
  }
  public void set_state( State s ) {
    m_current_state = s;
  }
  public void pull() {
    m_current_state.pull( this );
  }
}

interface State {
  void pull( CeilingFanPullChain wrapper );
}

class Off implements State {
  public void pull( CeilingFanPullChain wrapper ) {
    wrapper.set_state( new Low());
    System.out.println( "   low speed" );
  }
}

class Low implements State {
  public void pull( CeilingFanPullChain wrapper ) {
    wrapper.set_state( new Medium());
    System.out.println( "   medium speed" );
  }
}

class Medium implements State {
  public void pull( CeilingFanPullChain wrapper ) {
    wrapper.set_state( new High());
    System.out.println( "   high speed" );
  }
}

class High implements State {
  public void pull( CeilingFanPullChain wrapper ) {
    wrapper.set_state( new Off());
    System.out.println( "   turning off" );
  }
}

public class StateDemo {
  public static void main( String[] args ) {
    CeilingFanPullChain chain = new CeilingFanPullChain();
    while ( true ) {
      System.out.print( "Press " );
      get_line();
      chain.pull();
    }
  }
  static String get_line() {
    BufferedReader in = new BufferedReader( new InputStreamReader(System.in ))
      ;
    String line = null;
    try {
      line = in.readLine();
    }
    catch ( IOException ex ) {
      ex.printStackTrace();
    }
    return line;
  }
}

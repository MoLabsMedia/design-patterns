// --------------
// CREDIT: sourcemaking.com
// URL: https://sourcemaking.com/design_patterns/state/java/1
// --------------

class CeilingFanPullChain {
  private State m_current_state;

  public CeilingFanPullChain() {
    m_current_state = new StateOff();
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
class StateOff implements State {
  public void pull( CeilingFanPullChain wrapper ) {
    wrapper.set_state( new StateLow());
    System.out.println( "   Statelow speed" );
  }
}
class StateLow implements State {
  public void pull( CeilingFanPullChain wrapper ) {
    wrapper.set_state( new StateMedium());
    System.out.println( "   Statemedium speed" );
  }
}
class StateMedium implements State {
  public void pull( CeilingFanPullChain wrapper ) {
    wrapper.set_state( new StateHigh());
    System.out.println( "   Statehigh speed" );
  }
}
class StateHigh implements State {
  public void pull( CeilingFanPullChain wrapper ) {
    wrapper.set_state( new StateOff());
    System.out.println( "   turning Stateoff" );
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

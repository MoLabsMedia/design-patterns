// --------------
// CREDIT: sourcemaking.com
// URL: https://sourcemaking.com/design_patterns/state/java/3
// --------------

import java.io.*;

class Button {
  private State _current;

  public Button() { 
    _current = StateOff.instance(); 
  }
  public void setCurrent( State s ) { 
    _current = s; 
  }
  // 3. The "wrapper" always delegates to the "wrappee"
  public void push() { 
    _current.push( this ); 
  }
}

class State {
  public void push( Button b ) {              
    b.setCurrent( StateOff.instance() );
    System.out.println( " turning OFF" );
  }
}
class StateOn extends State {
  private static StateOn instance = new StateOn();
  private StateOn() {}

  public static State instance() { 
    return instance; 
  }
}
class StateOff extends State {
  private static StateOff instance = new StateOff();
  private StateOff() {}

  public static State instance() { 
    return instance; 
  }
  public void push( Button b ) {
    b.setCurrent( StateOn.instance() );
    System.out.println( " turning ON" ); 
  }
}

public class StateToggle {
  public static void main( String[] args ) throws IOException {
    InputStreamReader is = new InputStreamReader( System.in );
    int ch;
    Button btn = new Button();
    while ( true ) {
      System.out.print( "Press 'Enter'" );
      ch = is.read(); 
      ch = is.read();
      btn.push();
    }
  }
}

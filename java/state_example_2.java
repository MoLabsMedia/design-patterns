// --------------
// CREDIT: sourcemaking.com
// URL: https://sourcemaking.com/design_patterns/state/java/2
// --------------

// --------------
// CREDIT: sourcemaking.com
// URL: https://sourcemaking.com/design_patterns/state/java/5
// --------------

abstract class State {
  public void on( StateManager manager ) {}
  public void off( StateManager manager ) {}
  public void delay( StateManager manager ) {}
}
class StateA extends State {
  public void on( StateManager manager ) { 
    System.out.println( "StateA + on = StateC" );
    manager.changeState( 2 ); 
  }
  public void off( StateManager manager ) { 
    System.out.println( "StateA + off = StateB" );
    manager.changeState( 1 ); 
  }
  public void delay( StateManager manager ) { 
    System.out.println( "StateA + delay = StateA" );
    manager.changeState( 0 ); 
  }
}
class StateB extends State {
  public void on( StateManager manager ) { 
    System.out.println( "StateB + on = StateA" );
    manager.changeState( 0 ); 
  }
  public void off( StateManager manager ) { 
    System.out.println( "StateB + off = StateC" );
    manager.changeState( 2 ); 
  }
}
class StateC extends State {
  public void on( StateManager manager ) { 
    System.out.println( "StateC + on = StateB" );
    manager.changeState( 1 ); 
  }            
}

class StateManager {
  private State[] states = { 
    new StateA(), 
    new StateB(), 
    new StateC() 
  };
  
  private int _current = 0;
  
  public void on() { 
    states[_current].on( this ); 
  }
  public void off() { 
    states[_current].off( this ); 
  }
  public void delay() { 
    states[_current].delay( this ); 
  }
  public void changeState( int index ) { 
    _current = index; 
  }
}

public class StateDemo2 {
  public static void main( String[] args ) {
    StateManager manager = new StateManager();
    int[] msgs = { 2, 1, 2, 1, 0, 2, 0, 0 };
    for ( int i = 0; i < msgs.length; i++ )
      if ( msgs[i] == 0 ) manager.on();
      else if ( msgs[i] == 1 ) manager.off();
      else if ( msgs[i] == 2 ) manager.delay();
  }
}

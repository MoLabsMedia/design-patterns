// --------------
// CREDIT: sourcemaking.com
// URL: https://sourcemaking.com/design_patterns/state/java/7
// --------------

class Chain {
  private State _current;

  public Chain()                  { 
    _current = new StateOff(); 
  }
  public void setState( State s ) { 
    _current = s; 
  }
  public void pull()              { 
    _current.pull( this ); 
  }
}

abstract class State {
  public void pull( Chain wrapper ) {
    wrapper.setState( new StateOff() );
    System.out.println( "   turning off" );
  }   
}
class StateOff extends State {
  public void pull( Chain wrapper ) {
    wrapper.setState( new StateLow() );
    System.out.println( "   low speed" );
  }   
}
class StateLow extends State {
  public void pull( Chain wrapper ) {
    wrapper.setState( new StateMedium() );
    System.out.println( "   medium speed" );
  }   
}
class StateMedium extends State {
  public void pull( Chain wrapper ) {
    wrapper.setState( new StateHigh() );
    System.out.println( "   high speed" );
  }   
}
class StateHigh extends State {}

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

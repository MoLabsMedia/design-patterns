// --------------
// CREDIT: sourcemaking.com
// URL: https://sourcemaking.com/design_patterns/command/java/2
// --------------

import java.lang.reflect.*;

public class CommandReflect {
  private int state;
  public CommandReflect( int in ) {
    state = in;
  }
  public int addOne( Integer one ) {
    return state + one.intValue();
  }
  public int addTwo( Integer one, Integer two ) {
    return state + one.intValue() + two.intValue();
  }

  static public class Command {
    private Object   receiver;               // the "encapsulated" object
    private Method   action;                 // the "pre-registered" request
    private Object[] args;                   // the "pre-registered" arg list
    public Command( Object obj, String methodName, Object[] arguments ) {
      receiver = obj;
      args = arguments;
      class cls = obj.getclass();           // get the object's "class"
      class[] argTypes = new class[args.length];
      for ( int i = 0; i < args.length; i++ )   // get the "class" for each
        argTypes[i] = args[i].getclass();  //    supplied argument
      // get the "Method" data structure with the correct name and signature
      try {      action = cls.getMethod( methodName, argTypes );      }
      catch( NoSuchMethodException e ) { System.out.println( e ); }
    }
    public Object execute() {
      // in C++, you do something like --- return receiver->action( args ); 
      try {     return action.invoke( receiver, args );     }
      catch( IllegalAccessException e ) { System.out.println( e ); }
      catch( InvocationTargetException e ) { System.out.println( e ); }
      return null;
  }  }

  public static void main( String[] args ) {
    CommandReflect[] objs = { new CommandReflect( 1), new CommandReflect(2 ) };
    System.out.print( "Normal call results: " );
    System.out.print( objs[0].addOne( new Integer(3) ) + " " );
    System.out.print( objs[1].addTwo( new Integer(4),
                           new Integer(5) ) + " " );
    Command[] cmds = {
      new Command( objs[0], "addOne", new Integer[] { new Integer(3) } ),
      new Command( objs[1], "addTwo", new Integer[] { new Integer(4),
                                      new Integer(5) } ) };
    System.out.print( "\nReflection results:  " );
    for ( int i = 0; i < cmds.length; i++ )
       System.out.print( cmds[i].execute() + " " );
    System.out.println();
}  }

// Output:
// Normal call results: 4 11     // 1 + 3 = 4     // 2 + 4 + 5 = 11
// Reflection results:  4 11

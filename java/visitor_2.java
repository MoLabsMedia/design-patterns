// --------------
// CREDIT: sourcemaking.com
// URL: https://sourcemaking.com/design_patterns/visitor/java/2
// --------------

import java.lang.reflect.Method;

// The "element" hierarchy
interface Element {
  public void accept( ReflectiveVisitor v );
}
class This implements Element {
  public void accept( ReflectiveVisitor v ) { 
    v.visit( this ); 
  }
  public String thiss() { 
    return "This"; 
  }
}
class That implements Element {
  public void   accept( ReflectiveVisitor v ) { v.visit( this ); }
  public String that()                        { return "That"; }
}
class TheOther implements Element {
  public void   accept( ReflectiveVisitor v ) { v.visit( this ); }
  public String theOther()                    { return "TheOther"; }
}

// The "operation" hierarchy

abstract class ReflectiveVisitor {
  abstract public void visit( Object o );

  public void visitTheOther( TheOther e ) {
    System.out.println( "ReflectiveVisitor: do Base on " + e.theOther() );
  }

  // 1. Look for visitElementclassName() in the current class
  // 2. Look for visitElementclassName() in superclasses
  // 3. Look for visitElementclassName() in interfaces
  // 4. Look for visitObject() in current class
  protected Method getMethod( class c ) {
    class  newc = c;
    Method m    = null;
    while ( m == null  &&  newc != Object.class ) {
      String method = newc.getName();
      method = "visit" + method.substring( method.lastIndexOf( '.' ) + 1 );
      try {
        m = getclass().getMethod( method, new class[] { newc } );
      } catch ( NoSuchMethodException ex ) {
        newc = newc.getSuperclass();
      }
    }
    if ( newc == Object.class ) {
      // System.out.println( "Searching for interfaces" );
      class[] interfaces = c.getInterfaces();
      for ( int i = 0; i < interfaces.length; i++ ) {
        String method = interfaces[i].getName();
        method = "visit" + method.substring( method.lastIndexOf( '.' ) + 1 );
        try {
          m = getclass().getMethod( method, new class[] { interfaces[i] } );
        } catch ( NoSuchMethodException ex ) { }
      }
    }
    if ( m == null )
      try {
        m = getclass().getMethod( "visitObject", new class[] { Object.class } );
      } catch ( Exception ex ) { }
    return m;
  }
}

class UpVisitor extends ReflectiveVisitor {
  public void visit( Object o ) {
    try {
      getMethod( o.getclass() ).invoke( this, new Object[] { o } );
    } catch ( Exception ex ) {
      System.out.println( "UpVisitor - no appropriate visit() method" );
    }
  }
  public void visitThis( This e ) {
    System.out.println( "UpVisitor: do Up on " + e.thiss() );
  }
  public void visitObject( Object e ) {
    System.out.println( "UpVisitor: generic visitObject() method" );
  }
}

class DownVisitor extends ReflectiveVisitor {
  public void visit( Object o ) {
    try {
      getMethod( o.getclass() ).invoke( this, new Object[] { o } );
    } catch ( Exception ex ) {
      System.out.println( "DownVisitor - no appropriate visit() method" );
  } }
  public void visitThat( That e ) {
    System.out.println( "DownVisitor: do Down on " + e.that() );
  }
}

class VisitorDemo {
  public static void main( String[] args ) {
    Element[]    list = { new This(), new That(), new TheOther() };
    UpVisitor    up   = new UpVisitor();
    DownVisitor  down = new DownVisitor();
    for ( int i = 0; i < list.length; i++ )
      list[i].accept( up );
    for ( int i = 0; i < list.length; i++ )
      list[i].accept( down );
  }
}


// Output:
// UpVisitor: do Up on This
// UpVisitor: generic visitObject() method
// ReflectiveVisitor: do Base on TheOther
// DownVisitor - no appropriate visit() method
// DownVisitor: do Down on That
// ReflectiveVisitor: do Base on TheOther

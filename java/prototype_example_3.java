// --------------
// CREDIT: sourcemaking.com
// URL: https://sourcemaking.com/design_patterns/prototype/java/1
// --------------

public class FactoryProto {
  interface Xyz {
    Xyz clone();
  }
  static class Tom implements Xyz {
    public Xyz clone() { return new Tom(); }
    public String toString() { return "ttt"; }
  }
  static class Dick implements Xyz {
    public Xyz clone() { return new Dick(); }
    public String toString() { return "ddd"; }
  }
  static class Harry implements Xyz {
    public Xyz clone() { return new Harry(); }
    public String toString() { return "hhh"; }
  }

  static class Factory {
    private static java.util.Map prototypes = new java.util.HashMap();
    static {
      prototypes.put( "tom",   new Tom() );
      prototypes.put( "dick",  new Dick() );
      prototypes.put( "harry", new Harry() );
    }
    public static Xyz makeObject( String s ) {
      return ( (Xyz) prototypes.get(s) ).clone();
    }
  }

  public static void main( String[] args ) {
    for ( int i = 0; i < args.length; i++ ) {
      System.out.print( Factory.makeObject( args[i] ) + "  " );
    }
  }
}

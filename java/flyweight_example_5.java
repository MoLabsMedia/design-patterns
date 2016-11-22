// --------------
// CREDIT: sourcemaking.com
// URL: https://sourcemaking.com/design_patterns/flyweight/java/1
// --------------

class Gazillion {
  private static int num = 0;
  private int        row, col;
  public Gazillion( int maxPerRow ) {
    row = num/maxPerRow;
    col = num%maxPerRow;
    num++;
  }
  void report() {
    System.out.print( " " + row + col );
  }  
}

public class FlyweightDemo {
  public static final int ROWS = 6, COLS = 10;

  public static void main( String[] args ) {
    Gazillion[][] matrix = new Gazillion[ROWS][COLS];
    for ( int i = 0; i < ROWS; i++ )
      for ( int j = 0; j < COLS; j++ )
        matrix[i][j] = new Gazillion( COLS );
    for ( int i = 0; i < ROWS; i++ ) {
      for ( int j = 0; j < COLS; j++ )
        matrix[i][j].report();
      System.out.println();
    }  
  }  
}

// In this refactoring, the "row" state is considered shareable ( within each row anyways ), and the "col" state has been externalized ( it is supplied by the client when report() is called).
class Gazillion {
  private int row;
  public Gazillion( int theRow ) {
    row = theRow;
    System.out.println( "ctor: " + row );
  }
  void report( int theCol ) {
    System.out.print( " " + row + theCol );
  }  
}

class Factory {
  private Gazillion[] pool;
  public Factory( int maxRows ) {
    pool = new Gazillion[maxRows];
  }
  public Gazillion getFlyweight( int theRow ) {
    if ( pool[theRow] == null )
      pool[theRow] = new Gazillion( theRow );
    return pool[theRow];
  }  
}

public class FlyweightDemo {
  public static final int ROWS = 6, COLS = 10;

  public static void main( String[] args ) {
    Factory theFactory = new Factory( ROWS );
    for ( int i = 0; i < ROWS; i++ ) {
      for ( int j = 0; j < COLS; j++ )
        theFactory.getFlyweight( i ).report( j );
      System.out.println();
    }  
  }  
}

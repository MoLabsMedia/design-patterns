// --------------
// CREDIT: sourcemaking.com
// URL: https://sourcemaking.com/design_patterns/flyweight/java/1
// --------------

class Gazillion {
  private static int num = 0;
  private int        row, col;
  public Gazillion( int maxPerRow ) {
    row = num / maxPerRow;
    col = num % maxPerRow;
    num++;
  }
  void report() {
    System.out.print( " " + row + col );
}  }

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
}  }  }

// Output:
// 00 01 02 03 04 05 06 07 08 09
// 10 11 12 13 14 15 16 17 18 19
// 20 21 22 23 24 25 26 27 28 29
// 30 31 32 33 34 35 36 37 38 39
// 40 41 42 43 44 45 46 47 48 49
// 50 51 52 53 54 55 56 57 58 59



// In this refactoring, the "row" state is considered shareable ( within each row anyways ), and the "col" state has been externalized ( it is supplied by the client when report() is called).
class Gazillion {
  private int row;
  public Gazillion( int theRow ) {
    row = theRow;
    System.out.println( "ctor: " + row );
  }
  void report( int theCol ) {
    System.out.print( " " + row + theCol );
}  }

class Factory {
  private Gazillion[] pool;
  public Factory( int maxRows ) {
    pool = new Gazillion[maxRows];
  }
  public Gazillion getFlyweight( int theRow ) {
    if ( pool[theRow] == null )
      pool[theRow] = new Gazillion( theRow );
    return pool[theRow];
}  }

public class FlyweightDemo {
  public static final int ROWS = 6, COLS = 10;

  public static void main( String[] args ) {
    Factory theFactory = new Factory( ROWS );
    for ( int i = 0; i < ROWS; i++ ) {
      for ( int j = 0; j < COLS; j++ )
        theFactory.getFlyweight( i ).report( j );
      System.out.println();
}  }  }

// Output:
// ctor: 0
//  00 01 02 03 04 05 06 07 08 09
// ctor: 1
//  10 11 12 13 14 15 16 17 18 19
// ctor: 2
//  20 21 22 23 24 25 26 27 28 29
// ctor: 3
//  30 31 32 33 34 35 36 37 38 39
// ctor: 4
//  40 41 42 43 44 45 46 47 48 49
// ctor: 5
//  50 51 52 53 54 55 56 57 58 59

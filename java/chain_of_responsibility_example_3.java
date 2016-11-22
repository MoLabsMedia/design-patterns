// --------------
// CREDIT: sourcemaking.com
// URL: https://sourcemaking.com/design_patterns/chain_of_responsibility/java/1
// --------------

// Before: The client is responsible for stepping through the "list" of Handler objects, and determining when the request has been handled.
class Handler {
  private static java.util.Random s_rn = new java.util.Random();
  private static int s_next = 1;
  private int m_id = s_next++;

  public boolean handle( int num ) {
    if ( s_rn.nextInt(4 ) != 0) {
      System.out.print( m_id + "-busy  " );
      return false;
    }
    System.out.println( m_id + "-handled-" + num );
    return true;
  }
}

public class ChainDemo {
  public static void main( String[] args ) {
    Handler[] nodes =  {
      new Handler(), new Handler(), new Handler(), new Handler()
    };
    for ( int i = 1, j; i < 10; i++ ) {
      j = 0;
      while ( !nodes[j].handle(i ))
        j = ( j + 1 ) % nodes.length;
    }
  }
}

// Output:
// 1-busy  2-busy  3-busy  4-busy  1-busy  2-handled-1
// 1-busy  2-busy  3-handled-2
// 1-busy  2-busy  3-busy  4-handled-3
// 1-busy  2-busy  3-busy  4-busy  1-busy  2-busy
//     3-handled-4
// 1-busy  2-busy  3-handled-5
// 1-handled-6
// 1-busy  2-handled-7
// 1-busy  2-busy  3-busy  4-busy  1-busy  2-busy
//     3-busy  4-handled-8
// 1-busy  2-handled-9



// After: The client submits each request to the "chain" abstraction and is decoupled from all subsequent processing.
class Handler {
  private static java.util.Random s_rn = new java.util.Random();
  private static int s_next = 1;
  private int m_id = s_next++;
  private Handler m_next;

  public void add( Handler next ) {
    if ( m_next == null )
      m_next = next;
    else
      m_next.add( next );
  }
  public void wrap_around( Handler root ) {
    if ( m_next == null )
      m_next = root;
    else
      m_next.wrap_around( root );
  }
  public void handle( int num ) {
    if ( s_rn.nextInt(4 ) != 0) {
      System.out.print( m_id + "-busy  " );
      m_next.handle( num );
    }
    else
      System.out.println( m_id + "-handled-" + num );
  }
}

public class ChainDemo {
  public static void main( String[] args ) {
    Handler chain_root = new Handler();
    chain_root.add( new Handler());
    chain_root.add( new Handler());
    chain_root.add( new Handler());
    chain_root.wrap_around( chain );
    for ( int i = 1; i < 10; i++ )
      chain_root.handle(i);
  }
}

// Output:
// 1-busy  2-busy  3-handled-1
// 1-busy  2-busy  3-busy  4-busy  1-handled-2
// 1-busy  2-busy  3-busy  4-busy  1-busy  2-busy
//     3-busy  4-busy  1-handled-3
// 1-busy  2-handled-4
// 1-busy  2-busy  3-busy  4-handled-5
// 1-busy  2-busy  3-busy  4-busy  1-busy  2-handled-6
// 1-busy  2-handled-7
// 1-handled-8
// 1-busy  2-busy  3-handled-9

// --------------
// CREDIT: sourcemaking.com
// URL: https://sourcemaking.com/design_patterns/iterator/java/1
// --------------

// Before: The class SomeclassWithData provides access to its internal data structure. Clients can accidentally or maliciously trash that data structure.
class SomeclassWithData {
  private TreeSet < Integer > m_data = new TreeSet < Integer > ();

  public void add( int in ) {
    m_data.add(in);
  }
  public Collection get_data() {
    return m_data;
  }
}

class IteratorDemo {
  public static void main( String[] args ) {
    SomeclassWithData some_object = new SomeclassWithData();
    for ( int i = 9; i > 0; --i )
      some_object.add(i);
    Collection data = some_object.get_data();
    for ( java.util.Iterator it = data.iterator(); it.hasNext();)
      System.out.print( it.next() + "  ");
    System.out.println();

    // Do we really want a client to be able to
    // trash encapsulated state?
    data.clear();
    data = some_object.get_data();
    System.out.println( "size of data is " + data.size());
  }
}

// Output:
// 1  2  3  4  5  6  7  8  9
// size of data is 0



// After: Take traversal-of-a-collection functionality out of the collection and promote it to "full object status". This simplifies the collection, allows many traversals to be active simultaneously, and decouples collection algorithms from collection data structures.
class SomeclassWithData {
  private TreeSet < Integer > m_data = new TreeSet < Integer > ();

  public class Iterator {
    private SomeclassWithData m_collection;
    private java.util.Iterator m_it;
    private int m_current;
    public Iterator( SomeclassWithData in ) {
      m_collection = in;
    }
    public void first() {
      m_it = m_collection.m_data.iterator();
      next();
    }
    public void next() {
      try {
        m_current = m_it.next();
      }
      catch ( NoSuchElementException ex ) {
        m_current =  - 999;
      }
    }
    public boolean is_done() {
      return m_current ==  - 999;
    }
    public int current_item() {
      return m_current;
    }
  }

  public void add( int in ) {
    m_data.add(in);
  }
  public Iterator create_iterator() {
    return new Iterator( this );
  }
}

class IteratorDemo {
  public static void main( String[] args ) {
    SomeclassWithData some_object = new SomeclassWithData();
    for ( int i = 9; i > 0; --i )
      some_object.add(i);

    // get_data() has been removed.
    // Client has to use Iterator.
    SomeclassWithData.Iterator it1 = some_object.create_iterator();
    SomeclassWithData.Iterator it2 = some_object.create_iterator();

    for ( it1.first(); !it1.is_done(); it1.next())
      System.out.print( it1.current_item() + "  ");
    System.out.println();

    // Two simultaneous iterations
    for ( it1.first(), it2.first(); !it1.is_done(); it1.next(), it2.next())
      System.out.print( it1.current_item() + " " + it2.current_item() + "  " )
      ;
    System.out.println();
  }
}

// Output:
// 1  2  3  4  5  6  7  8  9
// 1 1  2 2  3 3  4 4  5 5  6 6  7 7  8 8  9 9

// --------------
// CREDIT: sourcemaking.com
// URL: https://sourcemaking.com/design_patterns/null_object/java-0
// --------------

// For an example of the Null Object pattern lets look at a very simple immutable linked list.
// A Linked list is either a head element and a tail which is a list or empty ( i.e. Null ). Thus is makes sense to model an abstract linked list with a class List which has two methods getTail and accept as per the Visitor pattern.
public abstract class List {
  public abstract List getTail();
  public abstract Object accept( ListVisitor visitor, Object param ); 
} 

// Now we will need a class for non-empty lists, we'll call it NonNullList. Its implementation is fairly straight forward.
public class NonNullList extends List {
  private Object head;
  private Object tail;

  /* Creates a list from a head and tail. Acts as "cons" */
  public NonNullList( Object head, Object tail ) {
    this.head = head;
    this.tail = tail;
  }

  // for convenience we could add a constructor taking only the head to make 1 element lists.

  public Object getHead() {
    return head;
  }

  public List getTail() {
    return tail;
  }

  public Object accept( ListVisitor visitor, Object param ) {
    return visitor.whenNonNullList( this, param );
  } 
}

// Now we get to the Null Object pattern's role. Rather than using null to represent an empty list, we will create a NullList class to represent the empty list. Notice that it knows exactly what to do. Access to the head was intentionally left out of the abstract list because the NullList would be unable to fulfill that interface.
// However, the empty list can provide a tail ( you may view it differently but I believe the rest of nothing is more nothing ) and it can certainly accept a visitor. Since all empty lists are identical, we will use the Singleton design pattern.
public class NullList extends List {
  private static final NullList instance = new NullList();
  private NullList() { }

  public static NullList Singleton() {
    return instance; 
  }

  public List getTail() {
    return this;
  }

  public Object accept( ListVisitor visitor, Object param ) {
    return visitor.whenNullList( this, param );
  } 
} 

// The entire system is completed by the visitor interface.
public interface ListVisitor {
  public Object whenNonNullList( NonNullList host, Object param );
  public Object whenNullList( NullList host, Object param ); 
}
// Notice that only the use of the Null Object pattern makes it safe to use a visitor. Otherwise a null pointer exception would occur when one tried to call accept on an empty list.

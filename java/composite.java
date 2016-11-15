// --------------
// CREDIT: sourcemaking.com
// URL: https://sourcemaking.com/design_patterns/composite/java/1
// --------------

// Before: 
class File {
  public File( String name ) {
    m_name = name;
  }
  public void ls() {
    System.out.println( Composite.g_indent + m_name );
  }
  private String m_name;
}

class Directory {
  public Directory( String name ) {
    m_name = name;
  }
  public void add( Object obj ) {
    m_files.add( obj );
  }
  public void ls() {
    System.out.println( Composite.g_indent + m_name );
    Composite.g_indent.append( "   " );
    for ( int i = 0; i < m_files.size(); ++i) {
      Object obj = m_files.get(i);
      // Recover the type of this object
      if ( obj.getclass().getName().equals("Directory" ))
        ( (Directory )obj).ls();
      else
        ( (File )obj).ls();
    }
    Composite.g_indent.setLength( CompositeDemo.g_indent.length() - 3);
  }
  private String m_name;
  private ArrayList m_files = new ArrayList();
}

class CompositeDemo {
  public static StringBuffer g_indent = new StringBuffer();

  public static void main( String[] args ) {
    Directory one = new Directory( "dir111" ), two = new Directory( "dir222" ),
      thr = new Directory( "dir333" );
    File a = new File( "a" ), b = new File( "b" ), c = new File( "c" ), d = new
      File( "d" ), e = new File( "e" );
    one.add(a);
    one.add( two );
    one.add(b);
    two.add(c);
    two.add(d);
    two.add( thr );
    thr.add(e);
    one.ls();
  }
}

// Output:
// dir111
//    a
//    dir222
//       c
//       d
//       dir333
//          e
//    b



// After: 
// Define a "lowest common denominator"
interface AbstractFile {
  public void ls();
}

// File implements the "lowest common denominator"
class File implements AbstractFile {
  public File( String name ) {
    m_name = name;
  }
  public void ls() {
    System.out.println( CompositeDemo.g_indent + m_name );
  }
  private String m_name;
}

// Directory implements the "lowest common denominator"
class Directory implements AbstractFile {
  public Directory( String name ) {
    m_name = name;
  }
  public void add( Object obj ) {
    m_files.add( obj );
  }
  public void ls() {
    System.out.println( CompositeDemo.g_indent + m_name );
    CompositeDemo.g_indent.append( "   " );
    for ( int i = 0; i < m_files.size(); ++i) {
      // Leverage the "lowest common denominator"
      AbstractFile obj = ( AbstractFile )m_files.get(i);
      obj.ls();
    }
    CompositeDemo.g_indent.setLength( CompositeDemo.g_indent.length() - 3);
  }
  private String m_name;
  private ArrayList m_files = new ArrayList();
}

class CompositeDemo {
  public static StringBuffer g_indent = new StringBuffer();

  public static void main( String[] args ) {
    Directory one = new Directory( "dir111" ), two = new Directory( "dir222" ),
      thr = new Directory( "dir333" );
    File a = new File( "a" ), b = new File( "b" ), c = new File( "c" ), d = new
      File( "d" ), e = new File( "e" );
    one.add(a);
    one.add( two );
    one.add(b);
    two.add(c);
    two.add(d);
    two.add( thr );
    thr.add(e);
    one.ls();
  }
}

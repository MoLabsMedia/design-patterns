// --------------
// CREDIT: sourcemaking.com
// URL: https://sourcemaking.com/design_patterns/facade/java/1
// --------------

// 1. Subsystem
class PointCarte {
  private double x, y;
  public PointCarte( double xx, double yy ) {
    x = xx;
    y = yy;
  }
  public void move( int dx, int dy ) {
    x += dx;
    y += dy;
  }
  public double getX() {
    return x;
  }
  public double getY() {
    return y;
  } 
  public String toString() {
    return "( " + x + "," + y + " )";
  }
}

// 1. Subsystem
class PointPolar {
  private double radius, angle;
  public PointPolar( double r, double a ) {
    radius = r;
    angle = a;
  }
  public void  rotate( int ang ) {
    angle += ang % 360;
  }
  public String toString() {
    return "[" + radius + "@" + angle + "]";
  }
}

// 1. Desired interface: move(), rotate()
class PointFacade {
  private PointCarte pc; // 2. Design a "wrapper" class
  
  public PointFacade( double xx, double yy ) { pc = new PointCarte( xx,yy ); }
  public String toString() { return pc.toString(); }
  // 4. Wrapper maps
  public void move( int dx, int dy ) { pc.move( dx,dy ); }
  public void rotate( int angle, PointFacade o ) {
    double x = pc.getX() - o.pc.getX();
    double y = pc.getY() - o.pc.getY();
    PointPolar pp = new PointPolar( Math.sqrt( x*x+y*y ), Math.atan2( y,x )*180/Math.PI );
    // 4. Wrapper maps
    pp.rotate( angle );
    System.out.println( "  PointPolar is " + pp );
    String str = pp.toString();  
    int i = str.indexOf( '@' );
    double r = Double.parseDouble( str.substring( 1,i ) );
    double a = Double.parseDouble( str.substring( i+1,str.length()-1) );
    pc = new PointCarte( r*Math.cos(a*Math.PI/180 ) + o.pc.getX(), r*Math.sin( a*Math.PI/180 ) + o.pc.getY() );
  }
}

class Line {
  private PointFacade o, e;
  public Line( PointFacade ori, PointFacade end ) {
    o = ori;
    e = end;
  }
  public void  move( int dx, int dy ) {
    o.move( dx, dy );
    e.move( dx, dy );
  }
  public void  rotate( int angle ) {
    e.rotate( angle, o );
  }
  public String toString() { return "origin is " + o + ", end is " + e; }
}

class FacadeDemo {
  public static void main( String[] args ) {
    // 3. Client uses the Facade
    Line line1 = new Line( new PointFacade( 2,4 ), new PointFacade( 5,7 ) );
    line1.move( -2,-4 );
    line1.rotate(45);
    Line line2 = new Line( new PointFacade( 2,1 ), new PointFacade( 2.866,1.5 ) );
    line2.rotate(30);
  }
}

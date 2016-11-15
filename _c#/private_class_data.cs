// --------------
// CREDIT: sourcemaking.com
// URL: https://sourcemaking.com/design_patterns/private_class_data/c-sharp-dot-net
// --------------

// Before: The attributes radius, color, and origin below should not change after the Circle() constructor. Note that the visibility is already limited by scoping them as private, but doing methods of class Circle can still modify them.
// Although marking attributes of classes as const (or final or ReadOnly in other programming languages) restricts their manipulation, the attributes above are set in the constructor and hence cannot be marked as such.
public class Circle {
   private double radius;
   private Color color;
   private Point origin;
   public Circle(double radius, Color color, Point origin) {
     this.radius = radius;
     this.color = color;
     this.origin = origin;
   }
   public double Circumference {
     get { return 2 * Math.PI * this.radius; }
   }
   public double Diameter {
     get { return 2 * this.radius; }
   }
   public void Draw(Graphics graphics) {
     //...
   }
 }



// After: The excess exposure of the attributes creates a type of (undesirable) coupling between methods that access those attributes. To reduce the visibility of the attributes and thus reduce the coupling, implement the private class data design pattern, as follows:
public class CircleData {
   private double radius;
   private Color color;
   private Point origin;
   public CircleData(double radius, Color color, Point origin) {
     this.radius = radius;
     this.color = color;
     this.origin = origin;
   }
   public double Radius {
     get { return this.radius; }
   }
   public Color Color {
     get { return this.color; }
   }
   public Point Origin {
     get { return this.origin; }
   }
 }
 public class Circle {
   private CircleData circleData;
   public Circle(double radius, Color color, Point origin) {
     this.circleData = new CircleData(radius, color, origin);
   }
   public double Circumference {
     get { return this.circleData.Radius * Math.PI; }
   }
   public double Diameter {
     get { return this.circleData.Radius * 2; }
   }
   public void Draw(Graphics graphics) {
     //...
   }
 }

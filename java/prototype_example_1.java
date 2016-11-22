// --------------
// CREDIT: Derek Banas
// URL: http://www.newthinktank.com/2012/09/prototype-design-pattern-tutorial/
// --------------

public interface Animal extends Cloneable { 
  public Animal makeCopy();
}
public class Sheep implements Animal {
  public Sheep(){ System.out.println("Sheep is Made"); }
  public Animal makeCopy() {
    System.out.println("Sheep is Being Made");
    Sheep sheepObject = null;
    try {
      sheepObject = (Sheep) super.clone();
    }
    catch (CloneNotSupportedException e) {
      System.out.println("The Sheep was Turned to Mush");
      e.printStackTrace();
     }
    return sheepObject;
  }
  public String toString(){ return "Dolly is my Hero, Baaaaa"; }
}

public class CloneFactory {
  public Animal getClone(Animal animalSample) { return animalSample.makeCopy(); }
}

public class TestCloning {
  public static void main(String[] args){
    CloneFactory animalMaker = new CloneFactory();
    Sheep sally = new Sheep();
    Sheep clonedSheep = (Sheep) animalMaker.getClone(sally);
    System.out.println(sally);
    System.out.println(clonedSheep);
    System.out.println("Sally HashCode: " + System.identityHashCode(System.identityHashCode(sally)));
    System.out.println("Clone HashCode: " + System.identityHashCode(System.identityHashCode(clonedSheep)));
  }
}

// --------------
// CREDIT: Derek Banas
// URL: http://www.newthinktank.com/2012/09/abstract-factory-design-pattern/
// --------------

public interface ESEngine{ 
  public String toString(); 
}
public class ESUFOEngine implements ESEngine{
  public String toString(){ return "1000 mph"; }
}
public class ESUFOBossEngine implements ESEngine{
  public String toString(){ return "2000 mph"; }
}

public interface ESWeapon{
  public String toString();
}
public class ESUFOGun implements ESWeapon{
  public String toString(){ return "20 damage"; }
}
public class ESUFOBossGun implements ESWeapon{
  public String toString(){ return "40 damage"; }
}

public abstract class EnemyShip {
  private String name;
  ESWeapon weapon;
  ESEngine engine;
  public String getName() { return name; }
  public void setName(String newName) { name = newName; }
  abstract void makeShip();
  public void followHeroShip(){ System.out.println(getName() + " is following the hero at " + engine ); }
  public void displayEnemyShip(){ System.out.println(getName() + " is on the screen"); }
  public void enemyShipShoots(){ System.out.println(getName() + " attacks and does " + weapon); }
  public String toString(){ 
    String infoOnShip = "The " + name + " has a top speed of " + engine + " and an attack power of " + weapon;
    return infoOnShip;
  }
}
public class UFOEnemyShip extends EnemyShip{
  EnemyShipFactory shipFactory;
  public UFOEnemyShip(EnemyShipFactory shipFactory){ this.shipFactory = shipFactory; }
  void makeShip() {
    System.out.println("Making enemy ship " + getName());
    weapon = shipFactory.addESGun();
    engine = shipFactory.addESEngine();
  }
}
public class UFOBossEnemyShip extends EnemyShip{
  EnemyShipFactory shipFactory;
  public UFOBossEnemyShip(EnemyShipFactory shipFactory){ this.shipFactory = shipFactory; }
  void makeShip() {
    System.out.println("Making enemy ship " + getName());
    weapon = shipFactory.addESGun();
    engine = shipFactory.addESEngine();
  }
}

public interface EnemyShipFactory{
  public ESWeapon addESGun();
  public ESEngine addESEngine();
}
public class UFOEnemyShipFactory implements EnemyShipFactory{
  public ESWeapon addESGun() { return new ESUFOGun(); }
  public ESEngine addESEngine() { return new ESUFOEngine(); }
}
public class UFOBossEnemyShipFactory implements EnemyShipFactory{
  public ESWeapon addESGun() { return new ESUFOBossGun(); }
  public ESEngine addESEngine() { return new ESUFOBossEngine(); }
}

public abstract class EnemyShipBuilding {
  protected abstract EnemyShip makeEnemyShip(String typeOfShip);
  public EnemyShip orderTheShip(String typeOfShip) {
    EnemyShip theEnemyShip = makeEnemyShip(typeOfShip);
    theEnemyShip.makeShip();
    theEnemyShip.displayEnemyShip();
    theEnemyShip.followHeroShip();
    theEnemyShip.enemyShipShoots()  
    return theEnemyShip;
  }
}
public class UFOEnemyShipBuilding extends EnemyShipBuilding {
  protected EnemyShip makeEnemyShip(String typeOfShip) {
    EnemyShip theEnemyShip = null;
    if(typeOfShip.equals("UFO")){
      EnemyShipFactory shipPartsFactory = new UFOEnemyShipFactory();
      theEnemyShip = new UFOEnemyShip(shipPartsFactory);
      theEnemyShip.setName("UFO Grunt Ship");
    } else
    if(typeOfShip.equals("UFO BOSS")){
      EnemyShipFactory shipPartsFactory = new UFOBossEnemyShipFactory();
      theEnemyShip = new UFOBossEnemyShip(shipPartsFactory);
      theEnemyShip.setName("UFO Boss Ship");
    }
    return theEnemyShip;
  }
}

public class EnemyShipTesting {
  public static void main(String[] args) {
    EnemyShipBuilding MakeUFOs = new UFOEnemyShipBuilding();
    EnemyShip theGrunt = MakeUFOs.orderTheShip("UFO");
    System.out.println(theGrunt + "\n");
    EnemyShip theBoss = MakeUFOs.orderTheShip("UFO BOSS");
    System.out.println(theBoss + "\n");
  }
}


// --------------
// CREDIT: Derek Banas
// URL: http://www.newthinktank.com/2012/09/adapter-design-pattern-tutorial/
// --------------

public interface EnemyAttacker {
  public void fireWeapon();
  public void driveForward();
  public void assignDriver(String driverName);
}
import java.util.Random;
public class EnemyTank implements EnemyAttacker{
  Random generator = new Random();
  public void fireWeapon() {
    int attackDamage = generator.nextInt(10) + 1;
    System.out.println("Enemy Tank Does " + attackDamage + " Damage");
  }
  public void driveForward() {
    int movement = generator.nextInt(5) + 1;
    System.out.println("Enemy Tank moves " + movement + " spaces");
  }
  public void assignDriver(String driverName) {
    System.out.println(driverName + " is driving the tank");
  }
}
public class EnemyRobotAdapter implements EnemyAttacker{
  EnemyRobot theRobot;
  public EnemyRobotAdapter(EnemyRobot newRobot){ theRobot = newRobot; }
  public void fireWeapon() { theRobot.smashWithHands(); }
  public void driveForward() { theRobot.walkForward(); }
  public void assignDriver(String driverName) { theRobot.reactToHuman(driverName); }
}

import java.util.Random;
public class EnemyRobot{
  Random generator = new Random();
  public void smashWithHands() {
    int attackDamage = generator.nextInt(10) + 1;
    System.out.println("Enemy Robot Causes " + attackDamage + " Damage With Its Hands");
  }
  public void walkForward() {
    int movement = generator.nextInt(5) + 1;
    System.out.println("Enemy Robot Walks Forward " + movement + " spaces");
  }
  public void reactToHuman(String driverName) {
    System.out.println("Enemy Robot Tramps on " + driverName);
  }
}

public class TestEnemyAttackers{
  public static void main(String[] args){
    EnemyTank rx7Tank = new EnemyTank();
    rx7Tank.assignDriver("Frank");
    rx7Tank.driveForward();
    rx7Tank.fireWeapon();

    EnemyRobot fredTheRobot = new EnemyRobot();
    EnemyAttacker robotAdapter = new EnemyRobotAdapter(fredTheRobot);
    robotAdapter.assignDriver("Mark");
    robotAdapter.driveForward();
    robotAdapter.fireWeapon();
  }
}

// --------------
// CREDIT: Derek Banas
// URL: http://www.newthinktank.com/2012/09/builder-design-pattern-tutorial/
// --------------

public interface RobotPlan{
  public void setRobotHead(String head);
  public void setRobotTorso(String torso);
  public void setRobotArms(String arms);
  public void setRobotLegs(String legs);
}
public class Robot implements RobotPlan{
  private String robotHead;
  private String robotTorso;
  private String robotArms;
  private String robotLegs;
  public void setRobotHead(String head) { robotHead = head; }
  public String getRobotHead(){ return robotHead; }
  public void setRobotTorso(String torso) { robotTorso = torso; }
  public String getRobotTorso(){ return robotTorso; }
  public void setRobotArms(String arms) { robotArms = arms; }
  public String getRobotArms(){ return robotArms; }
  public void setRobotLegs(String legs) { robotLegs = legs; }
  public String getRobotLegs(){ return robotLegs; }
}

public interface RobotBuilder {
  public void buildRobotHead();
  public void buildRobotTorso();
  public void buildRobotArms();
  public void buildRobotLegs();
  public Robot getRobot();
}
public class OldRobotBuilder implements RobotBuilder {
  private Robot robot;
  public OldRobotBuilder() { this.robot = new Robot(); }
  public void buildRobotHead() { robot.setRobotHead("Tin Head"); }
  public void buildRobotTorso() { robot.setRobotTorso("Tin Torso"); }
  public void buildRobotArms() { robot.setRobotArms("Blowtorch Arms"); }
  public void buildRobotLegs() { robot.setRobotLegs("Rollar Skates"); }
  public Robot getRobot() { return this.robot; }
}

public class RobotEngineer {
  private RobotBuilder robotBuilder;
  public RobotEngineer(RobotBuilder robotBuilder){ this.robotBuilder = robotBuilder; }
  public Robot getRobot(){ return this.robotBuilder.getRobot(); }
  public void makeRobot() {
    this.robotBuilder.buildRobotHead();
    this.robotBuilder.buildRobotTorso();
    this.robotBuilder.buildRobotArms();
    this.robotBuilder.buildRobotLegs();
  }
}

public class TestRobotBuilder {
  public static void main(String[] args){
    RobotBuilder oldStyleRobot = new OldRobotBuilder();
    RobotEngineer robotEngineer = new RobotEngineer(oldStyleRobot);
    robotEngineer.makeRobot();
    Robot firstRobot = robotEngineer.getRobot();
    System.out.println("Robot Built");
    System.out.println("Robot Head Type: " + firstRobot.getRobotHead());
    System.out.println("Robot Torso Type: " + firstRobot.getRobotTorso());
    System.out.println("Robot Arm Type: " + firstRobot.getRobotArms());
    System.out.println("Robot Leg Type: " + firstRobot.getRobotLegs());
  }
}

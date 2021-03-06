// --------------
// CREDIT: Derek Banas
// URL: http://www.newthinktank.com/2012/10/bridge-design-pattern-tutorial/
// --------------

// Implementor With the Bridge Design Pattern you create 2 layers of abstraction In this example I'll have an abstract class representing different types of devices. I also have an abstract class that will represent different types of remote controls This allows me to use an infinite variety of devices and remotes
abstract class EntertainmentDevice {
  public int deviceState;
  public int maxSetting;
  public int volumeLevel = 0;
  public abstract void buttonFivePressed();
  public abstract void buttonSixPressed();
  public void deviceFeedback() {
    if(deviceState > maxSetting || deviceState < 0) { deviceState = 0; }
    System.out.println("On Channel " + deviceState);
  }
  public void buttonSevenPressed() {
    volumeLevel++;
    System.out.println("Volume at: " + volumeLevel);
  }
  public void buttonEightPressed() {
    volumeLevel--;
    System.out.println("Volume at: " + volumeLevel);
  }
}
// Concrete Implementor Here is an implementation of the EntertainmentDevice abstract class. I'm specifying what makes it different from other devices
public class TVDevice extends EntertainmentDevice {
  public TVDevice(int newDeviceState, int newMaxSetting){
    deviceState = newDeviceState;
    maxSetting = newMaxSetting;
  }
  public void buttonFivePressed() {
    System.out.println("Channel Down");
    deviceState--;
  }
  public void buttonSixPressed() {
    System.out.println("Channel Up");
    deviceState++;
  }
}

// Abstraction This is an abstract class that will represent numerous ways to work with each device
public abstract class RemoteButton {
  // A reference to a generic device using aggregation
  private EntertainmentDevice theDevice;
  public RemoteButton(EntertainmentDevice newDevice) { theDevice = newDevice; }
  public void buttonFivePressed() { theDevice.buttonFivePressed(); }
  public void buttonSixPressed() { theDevice.buttonSixPressed(); }
  public void deviceFeedback() { theDevice.deviceFeedback(); }
  public abstract void buttonNinePressed();
}
// Refined Abstraction If I decide I want to further extend the remote I can
public class TVRemoteMute extends RemoteButton{
  public TVRemoteMute(EntertainmentDevice newDevice) { super(newDevice); }
  public void buttonNinePressed() { System.out.println("TV was Muted"); }
}
// Refined Abstraction If I decide I want to further extend the remote I can
public class TVRemotePause extends RemoteButton {
  public TVRemotePause(EntertainmentDevice newDevice) { super(newDevice); }
  public void buttonNinePressed() { System.out.println("TV was Paused"); }
}

public class TestTheRemote{
  public static void main(String[] args){
    RemoteButton theTV = new TVRemoteMute(new TVDevice(1, 200));
    RemoteButton theTV2 = new TVRemotePause(new TVDevice(1, 200));

    System.out.println("Test TV with Mute");
    theTV.buttonFivePressed();
    theTV.buttonSixPressed();
    theTV.buttonNinePressed();
    System.out.println("\nTest TV with Pause");
    theTV2.buttonFivePressed();
    theTV2.buttonSixPressed();
    theTV2.buttonNinePressed();
    theTV2.deviceFeedback();
  }
}

// --------------
// CREDIT: sourcemaking.com
// URL: https://sourcemaking.com/design_patterns/mediator/java/2
// --------------

// 1. The "intermediary"
class Mediator {
  // 4. The Mediator arbitrates
  private boolean slotFull = false;
  private int number;
  public synchronized void storeMessage( int num ) {
    // no room for another message
    while ( slotFull == true ) {
      try {
        wait();
      }
      catch (InterruptedException e ) { }
    }
    slotFull = true;
    number = num;
    notifyAll();
  }
  public synchronized int retrieveMessage() {
    // no message to retrieve
    while ( slotFull == false )
      try {
        wait();
      }
      catch (InterruptedException e ) { }
    slotFull = false;
    notifyAll();
    return number;
  }
}

class Producer extends Thread {
  // 2. Producers are coupled only to the Mediator
  private Mediator med;
  private int    id;
  private static int num = 1;
  public Producer( Mediator m ) {
    med = m;
    id = num++;
  }
  public void run() {
    int num;
    while ( true ) {
      med.storeMessage( num = ( int )( Math.random()*100) );
      System.out.print( "p" + id + "-" + num + "  " );
    }
  }
}

class Consumer extends Thread {
  // 3. Consumers are coupled only to the Mediator
  private Mediator med;
  private int    id;
  private static int num = 1;
  public Consumer( Mediator m ) {
    med = m;
    id = num++;
  }
  public void run() {
    while ( true ) {
      System.out.print( "c" + id + "-" + med.retrieveMessage() + "  ");
    }
  }
}

class MediatorDemo {
  public static void main( String[] args ) {
    Mediator mb = new Mediator();
    new Producer( mb ).start();
    new Producer( mb ).start();
    new Consumer( mb ).start();
    new Consumer( mb ).start();
    new Consumer( mb ).start();
    new Consumer( mb ).start();
  }
}

// Output:
// p1-87   c1-87   p2-37   c3-37   p1-28   c2-28   p2-58   c1-58   p1-18   c4-18
// p2-42   c3-42   p1-3   c2-3   p2-11   c3-11   p1-72   c2-72   p2-75   c3-75
// p1-93   c4-93   p2-52   c1-52   p1-21   c3-21   p2-80   c4-80   p1-96   c2-96

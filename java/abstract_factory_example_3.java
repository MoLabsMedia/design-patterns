// --------------
// CREDIT: sourcemaking.com
// URL: https://sourcemaking.com/design_patterns/abstract_factory/java/1
// --------------

public abstract class CPU {} 
class EmberCPU extends CPU {} 
class EmberMMU extends CPU {} 

public abstract class ArchitectureToolkit {
  private static final EmberToolkit emberToolkit = new EmberToolkit();
  private static final EnginolaToolkit enginolaToolkit = new EnginolaToolkit();

  static final ArchitectureToolkit getFactory( int architecture ) {
    switch ( architecture ) {
      case ENGINOLA:
        return enginolaToolkit;

      case EMBER:
        return emberToolkit;
    }
    String errMsg = Integer.toString( architecture );
    throw new IllegalArgumentException( errMsg );
  } 

  public abstract CPU createCPU();
  public abstract MMU createMMU();
} 
class EmberToolkit extends ArchitectureToolkit {
  public CPU createCPU() { return new EmberCPU(); } 
  public MMU createMMU() { return new EmberMMU(); } 
} 

public class Client {
  public void doIt() {
    AbstractFactory af;
    af = AbstractFactory.getFactory( AbstractFactory.EMBER );
    CPU cpu = af.createCPU();
  }
}

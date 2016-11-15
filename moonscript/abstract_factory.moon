class AbstractProductA
  new: ( arg ) => 
    print arg
    return
class ConcreteProductA1 extends AbstractProductA
class ConcreteProductA2 extends AbstractProductA

class AbstractProductB
  new: ( arg ) => 
    print arg
    return
class ConcreteProductB1 extends AbstractProductB
class ConcreteProductB2 extends AbstractProductB

class AbstractFactory
  buildA: () =>
  buildB: () =>
class ConcreteFactoryA extends AbstractFactory
  buildA: () => 
    return ConcreteProductA1( 'ConcreteProductA1' )
  buildB: () => 
    return ConcreteProductB1( 'ConcreteProductB1' )
class ConcreteFactoryB extends AbstractFactory
  buildA: () => 
    return ConcreteProductA2( 'ConcreteProductA2' )
  buildB: () => 
    return ConcreteProductB2( 'ConcreteProductB2' )

class Builder
  new: ( factory ) =>
    @productA = factory\buildA()
    @productB = factory\buildB()
    return

class Main
  @run: () =>
    factoryA = ConcreteFactoryA()
    builderA = Builder( factoryA )
    factoryB = ConcreteFactoryB()
    builderB = Builder( factoryB )
    return
    
Main.run()

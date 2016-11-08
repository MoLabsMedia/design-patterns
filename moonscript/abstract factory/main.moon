class AbstractProductA
  new: ( arg ) => print arg
class AbstractProductB
  new: ( arg ) => print arg

class ConcreteProductA1 extends AbstractProductA
class ConcreteProductA2 extends AbstractProductA
class ConcreteProductB1 extends AbstractProductB
class ConcreteProductB2 extends AbstractProductB

class AbstractFactory
  createProductA: () =>
  createProductB: () =>

class ConcreteFactory1 extends AbstractFactory
  createProductA: () => return ConcreteProductA1( 'ConcreteProductA1' )
  createProductB: () => return ConcreteProductB1( 'ConcreteProductB1' )
class ConcreteFactory2 extends AbstractFactory
  createProductA: () => return ConcreteProductA2( 'ConcreteProductA2' )
  createProductB: () => return ConcreteProductB2( 'ConcreteProductB2' )

class Client
  new: ( factory ) =>
    @abstractProductA = factory.createProductA()
    @abstractProductB = factory.createProductB()

class Example
  run: () =>
    factory1 = ConcreteFactory1()
    client1 = Client( factory1 )
    factory2 = ConcreteFactory2()
    client2 = Client( factory2 )
Example\run()

class AbstractProductA
  constructor: ( arg ) -> console.log arg
class AbstractProductB
  constructor: ( arg ) -> console.log arg

class ConcreteProductA1 extends AbstractProductA
class ConcreteProductA2 extends AbstractProductA
class ConcreteProductB1 extends AbstractProductB
class ConcreteProductB2 extends AbstractProductB

class AbstractFactory
  createProductA: ->
  createProductB: ->

class ConcreteFactory1 extends AbstractFactory
  createProductA: -> new ConcreteProductA1( 'ConcreteProductA1' )
  createProductB: -> new ConcreteProductB1( 'ConcreteProductB1' )
class ConcreteFactory2 extends AbstractFactory
  createProductA: -> new ConcreteProductA2( 'ConcreteProductA2' )
  createProductB: -> new ConcreteProductB2( 'ConcreteProductB2' )

class Client
  constructor: ( factory ) ->
    @abstractProductA = factory.createProductA()
    @abstractProductB = factory.createProductB()

class Example
  @run: ->
    factory1 = new ConcreteFactory1()
    client1 = new Client( factory1 )
    factory2 = new ConcreteFactory2()
    client2 = new Client( factory2 )
    
Example.run()

class AbstractProductA
  constructor: () -> 
class ConcreteProductA1 extends AbstractProductA
class ConcreteProductA2 extends AbstractProductA

class AbstractProductB
  constructor: ( arg ) -> 
class ConcreteProductB1 extends AbstractProductB
class ConcreteProductB2 extends AbstractProductB

class AbstractFactory
  buildA: ->
  buildB: ->
class ConcreteFactoryA extends AbstractFactory
  buildA: -> return new ConcreteProductA1()
  buildB: -> return new ConcreteProductB1()
class ConcreteFactoryB extends AbstractFactory
  buildA: -> return new ConcreteProductA2()
  buildB: -> return new ConcreteProductB2()

class Order
  constructor: ( factory ) ->
    @productA = factory.buildA()
    @productB = factory.buildB()
    return

class Main
  @run: ->
    factoryA = new ConcreteFactoryA()
    builderA = new Order( factoryA )
    
    factoryB = new ConcreteFactoryB()
    builderB = new Order( factoryB )
    return
    
Main.run()

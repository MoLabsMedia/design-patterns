class AbstractProductA
class ConcreteProductA1 extends AbstractProductA
class ConcreteProductA2 extends AbstractProductA

class AbstractProductB
class ConcreteProductB1 extends AbstractProductB
class ConcreteProductB2 extends AbstractProductB

class AbstractFactory
  build_a: ->
  build_b: ->
class ConcreteFactoryA extends AbstractFactory
  build_a: -> 
    return new ConcreteProductA1()
  build_b: -> 
    return new ConcreteProductB1()
class ConcreteFactoryB extends AbstractFactory
  build_a: -> 
    return new ConcreteProductA2()
  build_b: -> 
    return new ConcreteProductB2()

class Order
  constructor: ( factory ) ->
    @productA = factory.build_a()
    @productB = factory.build_b()
    return

class Main
  @run: ->
    factory_a = new ConcreteFactoryA()
    builder_a = new Order( factory_a )
    
    factory_b = new ConcreteFactoryB()
    builder_b = new Order( factory_b )
    
    return
    
Main.run()

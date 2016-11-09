class AbstractProductA
  constructor: ( arg ) -> 
    console.log arg
    return
class ConcreteProductA1 extends AbstractProductA
class ConcreteProductA2 extends AbstractProductA

class AbstractProductB
  constructor: ( arg ) -> 
    console.log arg
    return
class ConcreteProductB1 extends AbstractProductB
class ConcreteProductB2 extends AbstractProductB

class AbstractFactory
  buildA: ->
  buildB: ->
class ConcreteFactoryA extends AbstractFactory
  buildA: -> 
    return new ConcreteProductA1( 'ConcreteProductA1' )
  buildB: -> 
    return new ConcreteProductB1( 'ConcreteProductB1' )
class ConcreteFactoryB extends AbstractFactory
  buildA: -> 
    return new ConcreteProductA2( 'ConcreteProductA2' )
  buildB: -> 
    return new ConcreteProductB2( 'ConcreteProductB2' )

class Builder
  constructor: ( factory ) ->
    @productA = factory.buildA()
    @productB = factory.buildB()
    return

class Main
  @run: ->
    factoryA = new ConcreteFactoryA()
    builderA = new Builder( factoryA )
    factoryB = new ConcreteFactoryB()
    builderB = new Builder( factoryB )
    return
    
Main.run()

class ProductAStructure
  constructor: ( arg ) -> console.log arg
class ProductBStructure
  constructor: ( arg ) -> console.log arg

class RealProductA1 extends ProductAStructure
class RealProductA2 extends ProductAStructure
class RealProductB1 extends ProductBStructure
class RealProductB2 extends ProductBStructure

class FactoryStructure
  buildA: ->
  buildB: ->

class RealFactoryA extends FactoryStructure
  buildA: -> new RealProductA1( 'RealProductA1' )
  buildB: -> new RealProductB1( 'RealProductB1' )
class RealFactoryB extends FactoryStructure
  buildA: -> new RealProductA2( 'RealProductA2' )
  buildB: -> new RealProductB2( 'RealProductB2' )

class Builder
  constructor: ( factory ) ->
    @productA = factory.buildA()
    @productB = factory.buildB()
    return

class Example
  @run: ->
    factoryA = new RealFactoryA()
    builderA = new Builder( factoryA )
    factoryB = new RealFactoryB()
    builderB = new Builder( factoryB )
    
Example.run()

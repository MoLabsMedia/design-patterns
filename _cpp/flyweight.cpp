class AbstractFlyweight
  constructor: ( @key ) ->
  process: ( external ) ->
class ConcreteFlyweight extends AbstractFlyweight
  internal: []
  process: ( external ) ->
    @internal.push external
    return

class FlyweightFactory
  flyweights: {}
  getFlyweight: ( key ) -> return @flyweights[ key ] ?= new ConcreteFlyweight( key )

class Main
  @run: ->
    factory = new FlyweightFactory()
    flyweight_a = factory.getFlyweight( 'a' )
    flyweight_b = factory.getFlyweight( 'b' )
    flyweight_c = factory.getFlyweight( 'c' )
    flyweight_d = factory.getFlyweight( 'a' )

    flyweight_a.process( 'red' )
    console.log a.internal
    flyweight_b.process( 'green' )
    console.log b.internal
    flyweight_c.process( 'blue' )
    console.log c.internal
    flyweight_d.process( 'black' )
    console.log d.internal

Main.run()

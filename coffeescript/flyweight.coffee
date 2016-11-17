class AbstractFlyweight
  constructor: ( @key ) ->
  process: ( external ) ->
class ConcreteFlyweight extends AbstractFlyweight
  internal: []
  process: ( external ) ->
    @internal.push external
    return this
  show: () ->
    console.log @internal
    return

class FlyweightFactory
  constructor: -> @flyweights = {}
  getFlyweight: ( key ) -> return @flyweights[ key ] ?= new ConcreteFlyweight( key )

class Main
  @run: ->
    factory = new FlyweightFactory()
    a = factory.getFlyweight( 'a' )
    b = factory.getFlyweight( 'b' )
    c = factory.getFlyweight( 'c' )
    d = factory.getFlyweight( 'a' )
    a.process( 'red' ).show()
    b.process( 'green' ).show()
    c.process( 'blue' ).show()
    d.process( 'black' ).show()

Main.run()

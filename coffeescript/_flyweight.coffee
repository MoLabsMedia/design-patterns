class AbstractFlyweight
  constructor: ( @key ) ->
  process: ( external ) ->
class ConcreteFlyweight extends AbstractFlyweight
  internal: []
  process: ( external ) ->
    @internal.push external
    return this
  render: () ->
    console.log @internal
    return

class FlyweightFactory
  constructor: -> @flyweights = {}
  getFlyweight: ( key ) ->
    if not @flyweights[ key ]? 
      @flyweights[ key ] = new ConcreteFlyweight( key )
    return @flyweights[ key ]

class Main
  @run: ->
    factory = new FlyweightFactory()
    a = factory.getFlyweight( 'a' )
    b = factory.getFlyweight( 'b' )
    c = factory.getFlyweight( 'c' )
    d = factory.getFlyweight( 'a' )
    a.process( 'red' ).render()
    b.process( 'green' ).render()
    c.process( 'blue' ).render()
    d.process( 'black' ).render()

Main.run()

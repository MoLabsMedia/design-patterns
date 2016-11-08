class Flyweight
  constructor: ( @key ) ->
  operation: ( extrinsicState ) ->

class ConcreteFlyweight extends Flyweight
  intrinsicState: ''
  operation: ( extrinsicState ) ->
    @intrinsicState += "#{extrinsicState} "
    console.log @intrinsicState
class UnsharedConcreteFlyweight extends Flyweight
  allState: null

class FlyweightFactory
  constructor: -> @flyweights = {}
  getFlyweight: ( key ) ->
    if not @flyweights[ key ]? then @flyweights[ key ] = new ConcreteFlyweight( key )
    @flyweights[ key ]

class Client
  @run: ->
    factory = new FlyweightFactory()
    foo = factory.getFlyweight( 'foo' )
    bar = factory.getFlyweight( 'bar' )
    baz = factory.getFlyweight( 'baz' )
    qux = factory.getFlyweight( 'foo' )
    foo.operation( 'red' )
    bar.operation( 'green' )
    baz.operation( 'blue' )
    qux.operation( 'black' )
Client.run()

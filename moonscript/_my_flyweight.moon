class AbstractFlyweight
  new: ( @key ) =>
  process: ( external ) =>
class ConcreteFlyweight extends AbstractFlyweight
  internal: {}
  process: ( external ) =>
    table.insert( @internal, external )
    return self
  render: () =>
    result = [ x for _, x in ipairs( @internal ) ]    
    print result[ 'a' ]
    -- print @internal
    return

class FlyweightFactory
  new: () => 
    @flyweights = {}
    return
  getFlyweight: ( key ) =>
    if not @flyweights[ key ]
      @flyweights[ key ] = ConcreteFlyweight( key )
    return @flyweights[ key ]

class Main
  @run: () =>
    factory = FlyweightFactory()
    a = factory\getFlyweight( 'a' )
    b = factory\getFlyweight( 'b' )
    c = factory\getFlyweight( 'c' )
    d = factory\getFlyweight( 'a' )
    a\process( 'red' )\render()
    b\process( 'green' )\render()
    c\process( 'blue' )\render()
    d\process( 'black' )\render()
    return

Main.run()

import ConcreteFlyweight from require 'ConcreteFlyweight'
class FlyweightFactory
  new: () => @flyweights = {}
  getFlyweight: ( key ) =>
    if not @flyweights[ key ] then @flyweights[ key ] = ConcreteFlyweight( key )
    @flyweights[ key ]

{ :FlyweightFactory }

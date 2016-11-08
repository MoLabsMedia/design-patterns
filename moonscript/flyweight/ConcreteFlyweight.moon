import Flyweight from require 'Flyweight'
class ConcreteFlyweight extends Flyweight
  intrinsicState: ''
  operation: ( extrinsicState ) =>
    @intrinsicState ..= "#{extrinsicState} "
    print @intrinsicState
{ :ConcreteFlyweight }

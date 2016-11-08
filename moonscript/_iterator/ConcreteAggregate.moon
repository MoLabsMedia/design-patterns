import Aggregate from require 'Aggregate'
import List from require 'List'
import ConcreteIterator from require 'ConcreteIterator'
class ConcreteAggregate extends Aggregate
  createIterator: ( items ) ->
    list = List()
    for key, val in pairs( items )
      val[ '__POINTER__' ] = key
      list\append( val )
    ConcreteIterator( list )

{ :ConcreteAggregate }

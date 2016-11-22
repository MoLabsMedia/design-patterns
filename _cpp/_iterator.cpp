class AbstractIterator
  first: ->
  next: ->
  current: ->
  isDone: ->
class ConcreteIterator extends AbstractIterator
  _current = 0
  constructor: ( @list ) -> 
  first: -> 
    _current = 0
    return
  next: -> 
    _current += 1
    return
  isDone: -> 
    return _current >= @list.count()
  current: ->
    if @isDone()
      return false
    return @list.get( _current )

class AbstractAggregate
  createIterator: ->
class ConcreteAggregate extends AbstractAggregate
  createIterator: ( collection ) ->
    list = new List()
    for key, val of collection
      val.__POINTER__ = key
      list.append( val )
    return new ConcreteIterator( list )

class Main
  @run: ->
    aggregate = new ConcreteAggregate()
    iterator = aggregate.createIterator( some_collection )
    while not iterator.isDone()
      current = iterator.current()
      # do something with the current
      iterator.next()
    return

Main.run()

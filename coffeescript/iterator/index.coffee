class Iterator
  first: ->
  next: ->
  isDone: ->
  currentItem: ->
class ConcreteIterator extends Iterator
  constructor: ( @list ) -> @current = 0
  first: -> @current = 0
  next: -> @current += 1
  isDone: -> @current >= @list.count()
  currentItem: ->
    throw new Error 'IteratorOutOfBounds' if @isDone()
    @list.get( @current )

class Aggregate
  createIterator: ->
class ConcreteAggregate extends Aggregate
  createIterator: ( items ) ->
    list = new List()
    for key, val of items
      val.__POINTER__ = key
      list.append val
    new ConcreteIterator( list )

class Client
  @run: ->
    aggregate = new ConcreteAggregate()
    iterator = aggregate.createIterator( items )
    while not iterator.isDone()
      current = iterator.currentItem()
      # Do something with the item here...
      iterator.next()
Client.run()

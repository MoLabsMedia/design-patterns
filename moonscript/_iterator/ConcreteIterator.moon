import Iterator from require 'Iterator'
class ConcreteIterator extends Iterator
  constructor: ( @list ) -> @current = 0
  first: -> @current = 0
  next: -> @current += 1
  isDone: -> @current >= @list\count()
  currentItem: ->
    print 'IteratorOutOfBounds' if @isDone()
    @list\get( @current )

{ :ConcreteIterator }

class AbstractIterator
  first: () =>
  next: () =>
  current: () =>
  isDone: () =>
class ConcreteIterator extends AbstractIterator
  new: ( @list ) => 
    @current = 0
    return
  first: () => 
    @current = 0
    return
  next: () => 
    @current += 1
    return
  isDone: () => 
    return @current >= @list\count()
  current: () =>
    if @isDone()
      print 'out of bounds' 
    return @list\get( @current )

class AbstractAggregate
  createIterator: () =>
class ConcreteAggregate extends AbstractAggregate
  createIterator: ( items ) =>
    list = List()
    for key, val of items
      val\__POINTER__ = key
      list\append val
    ConcreteIterator( list )

class Main
  @run: () =>
    aggregate = ConcreteAggregate()
    iterator = aggregate\createIterator( items )
    while not iterator\isDone()
      current = iterator\current()

      iterator\next()
    return

Main.run()

import ConcreteAggregate from require 'ConcreteAggregate'
class Client
  run: ->
    aggregate = ConcreteAggregate()
    iterator = aggregate\createIterator( items )
    while not iterator\isDone()
      current = iterator\currentItem()
      -- Do something with the item here\\\
      iterator\next()

Client\run()

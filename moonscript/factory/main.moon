import ConcreteCreator from require 'ConcreteCreator'
class Example
  run: () =>
    creator = ConcreteCreator()
    print creator\factoryMethod( 1 )
    print creator\factoryMethod( 2 )
    print creator\factoryMethod( 3 )

Example\run()

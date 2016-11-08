import ConcreteDecoratorA from require 'ConcreteDecoratorA'
import ConcreteDecoratorB from require 'ConcreteDecoratorB'
import ConcreteComponent from require 'ConcreteComponent'
class Example
  run: () =>
    cmpt = ConcreteDecoratorA( ConcreteDecoratorB( ConcreteComponent() ) )
    cmpt\process()
    return

Example\run()

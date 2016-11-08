import Decorator from require 'Decorator'
class ConcreteDecoratorB extends Decorator
  process: () =>
    @component\add 'concreteDecoratorBProcess', true
    super()

{ :ConcreteDecoratorB }

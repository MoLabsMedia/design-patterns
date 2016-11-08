import Decorator from require 'Decorator'
class ConcreteDecoratorA extends Decorator
  process: () =>
    @component\add 'concreteDecoratorAProcess', true
    super()
{ :ConcreteDecoratorA }

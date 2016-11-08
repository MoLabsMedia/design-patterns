import ConcreteStrategyA from require 'ConcreteStrategyA'
import ConcreteStrategyB from require 'ConcreteStrategyB'
import ConcreteStrategyC from require 'ConcreteStrategyC'
class Example
  run: () =>
    context = Context( ConcreteStrategyA() )
    resultA = context\contextInterface()
    context = Context( ConcreteStrategyB() )
    resultB = context\contextInterface()
    context = Context( ConcreteStrategyC() )
    resultC = context\contextInterface()

Example\run()

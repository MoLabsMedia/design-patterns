class Strategy
  algorithmInterface: ->
class ConcreteStrategyA extends Strategy
  algorithmInterface: -> console.log 'ConcreteStrategyA'
class ConcreteStrategyB extends Strategy
  algorithmInterface: -> console.log 'ConcreteStrategyB'
class ConcreteStrategyC extends Strategy
  algorithmInterface: -> console.log 'ConcreteStrategyC'

class Context
  constructor: ( @strategy ) ->
  contextInterface: -> @strategy.algorithmInterface()

class Example
  @run: ->
    context = new Context( new ConcreteStrategyA() )
    resultA = context.contextInterface
    context = new Context( new ConcreteStrategyB() )
    resultB = context.contextInterface
    context = new Context( new ConcreteStrategyC() )
    resultC = context.contextInterface
Example.run()

class Context
  constructor: ( @strategy ) ->
  applyAlgorithm: ->
    return @strategy.applyAlgorithm()

class AbstractStrategy
  applyAlgorithm: ->
class ConcreteStrategyA extends AbstractStrategy
  applyAlgorithm: ->
class ConcreteStrategyB extends AbstractStrategy
  applyAlgorithm: ->
class ConcreteStrategyC extends AbstractStrategy
  applyAlgorithm: ->

class Main
  @run: ->
    context = new Context( new ConcreteStrategyA() )
    result_a = context.applyAlgorithm()

    context = new Context( new ConcreteStrategyB() )
    result_b = context.applyAlgorithm()

    context = new Context( new ConcreteStrategyC() )
    result_c = context.applyAlgorithm()

Main.run()

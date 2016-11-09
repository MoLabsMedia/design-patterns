class Context
  constructor: ( @strategy ) ->
  applyAlgorithm: ->
    return @strategy.applyAlgorithm()

class AbstractStrategy
  applyAlgorithm: ->
class ConcreteStrategyA extends AbstractStrategy
  applyAlgorithm: ->
    return 'Algorithm applied in Concrete Strategy A'
class ConcreteStrategyB extends AbstractStrategy
  applyAlgorithm: ->
    return 'Algorithm applied in Concrete Strategy B'
class ConcreteStrategyC extends AbstractStrategy
  applyAlgorithm: ->
    return 'Algorithm applied in Concrete Strategy C'

class Main
  @run: ->
    ctx = new Context( new ConcreteStrategyA() )
    resultA = ctx.applyAlgorithm()
    console.log resultA

    ctx = new Context( new ConcreteStrategyB() )
    resultB = ctx.applyAlgorithm()
    console.log resultB

    ctx = new Context( new ConcreteStrategyC() )
    resultC = ctx.applyAlgorithm()
    console.log resultC

Main.run()

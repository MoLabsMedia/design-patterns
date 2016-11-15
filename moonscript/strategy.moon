class Context
  new: ( @strategy ) =>
  applyAlgorithm: () =>
    return @strategy\applyAlgorithm()

class AbstractStrategy
  applyAlgorithm: () =>
class ConcreteStrategyA extends AbstractStrategy
  applyAlgorithm: () =>
    return 'Algorithm applied in Concrete Strategy A'
class ConcreteStrategyB extends AbstractStrategy
  applyAlgorithm: () =>
    return 'Algorithm applied in Concrete Strategy B'
class ConcreteStrategyC extends AbstractStrategy
  applyAlgorithm: () =>
    return 'Algorithm applied in Concrete Strategy C'

class Main
  @run: () =>
    ctx = Context( ConcreteStrategyA() )
    resultA = ctx\applyAlgorithm()
    print resultA

    ctx = Context( ConcreteStrategyB() )
    resultB = ctx\applyAlgorithm()
    print resultB

    ctx = Context( ConcreteStrategyC() )
    resultC = ctx\applyAlgorithm()
    print resultC

Main.run()

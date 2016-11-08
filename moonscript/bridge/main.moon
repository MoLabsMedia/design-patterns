import ConcreteImplementorA from require 'ConcreteImplementorA'
import RefinedAbstraction from require 'RefinedAbstraction'
import ConcreteImplementorB from require 'ConcreteImplementorB'
class Client
  run: () =>
    concreteImplementorA = ConcreteImplementorA()
    refinedAbstractionA = RefinedAbstraction( concreteImplementorA )
    refinedAbstractionA\operation()
    concreteImplementorB = ConcreteImplementorB()
    refinedAbstractionB = RefinedAbstraction( concreteImplementorB )
    refinedAbstractionB\operation()

Client\run()

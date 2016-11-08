class Implementor
  operationImp: ->
class ConcreteImplementorA extends Implementor
  operationImp: -> console.log 'ConcreteImplementorA::operationImp'
class ConcreteImplementorB extends Implementor
  operationImp: -> console.log 'ConcreteImplementorB::operationImp'

class Abstraction
  constructor: ( @imp ) ->
  operation: -> @imp.operationImp()

class RefinedAbstraction extends Abstraction

class Client
  @run: ->
    concreteImplementorA = new ConcreteImplementorA()
    refinedAbstractionA = new RefinedAbstraction( concreteImplementorA )
    refinedAbstractionA.operation()
    concreteImplementorB = new ConcreteImplementorB()
    refinedAbstractionB = new RefinedAbstraction( concreteImplementorB )
    refinedAbstractionB.operation()
Client.run()

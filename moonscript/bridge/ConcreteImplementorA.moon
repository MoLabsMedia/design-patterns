import Implementor from require 'Implementor'
class ConcreteImplementorA extends Implementor
  operationImp: () => print 'ConcreteImplementorA::operationImp'

{ :ConcreteImplementorA }

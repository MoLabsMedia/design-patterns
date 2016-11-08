import AbstractFactory from require 'AbstractFactory'
import ConcreteProductA1 from require 'ConcreteProductA1'
import ConcreteProductB1 from require 'ConcreteProductB1'
class ConcreteFactory1 extends AbstractFactory
  createProductA: () => return ConcreteProductA1( 'ConcreteProductA1' )
  createProductB: () => return ConcreteProductB1( 'ConcreteProductB1' )

{ :ConcreteFactory1 }

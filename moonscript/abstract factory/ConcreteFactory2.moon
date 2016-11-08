import AbstractFactory from require 'AbstractFactory'
import ConcreteProductA2 from require 'ConcreteProductA2'
import ConcreteProductB2 from require 'ConcreteProductB2'
class ConcreteFactory2 extends AbstractFactory
  createProductA: () => return ConcreteProductA2( 'ConcreteProductA2' )
  createProductB: () => return ConcreteProductB2( 'ConcreteProductB2' )

{ :ConcreteFactory2 }

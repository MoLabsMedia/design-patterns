import Creator from require 'Creator'
import ConcreteProduct1 from require 'ConcreteProduct1'
import ConcreteProduct2 from require 'ConcreteProduct2'
import ConcreteProduct3 from require 'ConcreteProduct3'
class ConcreteCreator extends Creator
  factoryMethod: ( id ) =>
    switch id
      when id == 1 then return ConcreteProduct1()
      when id == 2 then return ConcreteProduct2()
      else return ConcreteProduct3()

{ :ConcreteCreator }

class AbstractProduct
class ConcreteProductA extends AbstractProduct
class ConcreteProductB extends AbstractProduct
class ConcreteProductC extends AbstractProduct

class AbstractFactory
  build: ->
class ConcreteFactory extends AbstractFactory
  build: ( type ) ->
    switch type
      when 'a'
        return new ConcreteProductA()
      when 'b'
        return new ConcreteProductB()
      else
        return new ConcreteProductC()

class Main
  @run: ->
    factory = new ConcreteFactory()
    console.log factory.build( 'a' )
    console.log factory.build( 'b' )
    console.log factory.build( 'c' )
    return

Main.run()

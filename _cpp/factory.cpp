class AbstractProduct
class ConcreteProductA extends AbstractProduct
class ConcreteProductB extends AbstractProduct
class ConcreteProductC extends AbstractProduct

class AbstractFactory
  build: ->
class ConcreteFactory extends AbstractFactory
  build: ( key ) ->
    switch key
      when 'rock'
        return new ConcreteProductA()
      when 'paper'
        return new ConcreteProductB()
      else
        return new ConcreteProductC()

class Main
  @run: ->
    factory = new ConcreteFactory()
    console.log factory.build( 'rock' )
    console.log factory.build( 'paper' )
    console.log factory.build( 'scissor' )
    return

Main.run()

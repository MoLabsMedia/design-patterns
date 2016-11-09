class AbstractProduct
class ConcreteProductA extends AbstractProduct
class ConcreteProductB extends AbstractProduct
class ConcreteProductC extends AbstractProduct

class AbstractCreator
  build: ->
class ConcreteCreator extends AbstractCreator
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
    creator = new ConcreteCreator()
    console.log creator.build( 'a' )
    console.log creator.build( 'b' )
    console.log creator.build( 'c' )
    return

Main.run()

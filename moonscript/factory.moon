class AbstractProduct
class ConcreteProductA extends AbstractProduct
class ConcreteProductB extends AbstractProduct
class ConcreteProductC extends AbstractProduct

class AbstractCreator
  build: () =>
class ConcreteCreator extends AbstractCreator
  build: ( type ) =>
    switch type
      when 'a'
        return ConcreteProductA()
      when 'b'
        return ConcreteProductB()
      else
        return ConcreteProductC()

class Main
  @run: () =>
    creator = ConcreteCreator()
    print creator\build( 'a' )
    print creator\build( 'b' )
    print creator\build( 'c' )
    return

Main.run()

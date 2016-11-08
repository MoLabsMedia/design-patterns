class Product

class ConcreteProduct1 extends Product
class ConcreteProduct2 extends Product
class ConcreteProduct3 extends Product

class Creator
  factoryMethod: ->
  operation: -> product = @factoryMethod()

class ConcreteCreator extends Creator
  factoryMethod: (id) ->
    switch id
      when id is 1 then return new ConcreteProduct1()
      when id is 2 then return new ConcreteProduct2()
      else return new ConcreteProduct3()

class Example
  @run: ->
    creator = new ConcreteCreator()
    console.log creator.factoryMethod 1
    console.log creator.factoryMethod 2
    console.log creator.factoryMethod 3
Example.run()

class ProductStructure

class RealProductA extends ProductStructure
class RealProductB extends ProductStructure
class RealProductC extends ProductStructure

class CreatorStructure
  build: ->

class RealCreator extends CreatorStructure
  build: ( type ) ->
    switch type
      when 1
        return new RealProductA()
      when 2
        return new RealProductB()
      else
        return new RealProductC()

class Example
  @run: ->
    creator = new RealCreator()
    console.log creator.build( 1 )
    console.log creator.build( 2 )
    console.log creator.build( 3 )
    return

Example.run()

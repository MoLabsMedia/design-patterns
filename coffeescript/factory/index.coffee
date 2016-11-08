class ProductStructure

class RealProductA extends ProductStructure
class RealProductB extends ProductStructure
class RealProductC extends ProductStructure

class CreatorStructure
  build: ->

class RealCreator extends CreatorStructure
  build: ( type ) ->
    switch type
      when 'a'
        return new RealProductA()
      when 'b'
        return new RealProductB()
      else
        return new RealProductC()

class Example
  @run: ->
    creator = new RealCreator()
    console.log creator.build( 'a' )
    console.log creator.build( 'b' )
    console.log creator.build( 'c' )
    return

Example.run()

class AbstractClass
  templateMethod: ->
    @primitiveOperation1()
    @primitiveOperation2()
  primitiveOperation1: ->
  primitiveOperation2: ->
class ConcreteClass extends AbstractClass
  primitiveOperation1: -> console.log 'primitiveOperation1'
  primitiveOperation2: -> console.log 'primitiveOperation2'

# Static Template Method
class StaticAbstractClass
  @templateMethod: ->
    cls = new @()
    cls.primitiveOperation1()
    cls.primitiveOperation2()
  primitiveOperation1: ->
  primitiveOperation2: ->
class StaticConcreteClass extends StaticAbstractClass
  primitiveOperation1: -> console.log 'primitiveOperation1'
  primitiveOperation2: -> console.log 'primitiveOperation2'

class Example
  run: ->
    concrete = new ConcreteClass()
    concrete.templateMethod()
    
    concrete = new StaticConcreteClass()
    StaticConcreteClass.templateMethod()
Example.run()

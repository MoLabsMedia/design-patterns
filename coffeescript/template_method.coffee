class AbstractClass
  process: ->
    @actionA()
    @actionB()
    return
  actionA: ->
  actionB: ->
class ConcreteClass extends AbstractClass
  actionA: -> 
  actionB: -> 

class StaticAbstractClass
  @process: ->
    cls = new @()
    cls.actionA()
    cls.actionB()
    return
  actionA: ->
  actionB: ->
class StaticConcreteClass extends StaticAbstractClass
  actionA: -> 
  actionB: -> 

class Main
  @run: ->
    clsA = new ConcreteClass()
    clsA.process()
    
    StaticConcreteClass.process()
    return

Main.run()

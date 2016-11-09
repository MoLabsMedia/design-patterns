class AbstractClass
  process: ->
    @actionA()
    @actionB()
    return
  actionA: ->
  actionB: ->

class ConcreteClass extends AbstractClass
  actionA: -> 
    console.log 'action A is taken'
    return
  actionB: -> 
    console.log 'action B is taken'
    return

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
    console.log 'action A is taken'
    return
  actionB: -> 
    console.log 'action B is taken'
    return

class Main
  @run: ->
    clsA = new ConcreteClass()
    clsA.process()
    
    StaticConcreteClass.process()
    return

Main.run()

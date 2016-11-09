class AbstractSystem
  process: () ->
class ConcreteSystemA extends AbstractSystem
  process: -> 
    console.log 'process from ConcreteSystemA'
    return
class ConcreteSystemB extends AbstractSystem
  process: -> 
    console.log 'process from ConcreteSystemB'
    return

class Facade
  request: ->
    sysA = new ConcreteSystemA()
    sysA.process()
    sysB = new ConcreteSystemB()
    sysB.process()
    return

class Main
  @run: ->
    facade = new Facade()
    facade.request()
    return

Main.run()

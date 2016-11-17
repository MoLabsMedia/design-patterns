class AbstractSystem
class ConcreteSystemA extends AbstractSystem
  doThis: -> 
    console.log 'process from ConcreteSystemA'
    return
class ConcreteSystemB extends AbstractSystem
  doThat: -> 
    console.log 'process from ConcreteSystemB'
    return

class Facade
  process: ->
    sysA = new ConcreteSystemA()
    sysA.doThis()

    sysB = new ConcreteSystemB()
    sysB.doThat()
    return

class Main
  @run: ->
    facade = new Facade()
    facade.process()
    return

Main.run()

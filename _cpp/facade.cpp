class AbstractSystem
class ConcreteSystemA extends AbstractSystem
  doThis: -> 
class ConcreteSystemB extends AbstractSystem
  doThat: -> 

class Facade
  process: ->
    sys_a = new ConcreteSystemA()
    sys_a.doThis()

    sys_b = new ConcreteSystemB()
    sys_b.doThat()
    return

class Main
  @run: ->
    facade = new Facade()
    facade.process()
    return

Main.run()

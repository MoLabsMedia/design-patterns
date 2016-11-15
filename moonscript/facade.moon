class AbstractSystem
  process: () =>
class ConcreteSystemA extends AbstractSystem
  process: () => 
    print 'process from ConcreteSystemA'
    return
class ConcreteSystemB extends AbstractSystem
  process: () => 
    print 'process from ConcreteSystemB'
    return

class Facade
  request: () =>
    sysA = ConcreteSystemA()
    sysA\process()
    sysB = ConcreteSystemB()
    sysB\process()
    return

class Main
  @run: () =>
    facade = Facade()
    facade\request()
    return

Main.run()

class AbstractClass
  process: () =>
    @actionA()
    @actionB()
    return
  actionA: () =>
  actionB: () =>

class ConcreteClass extends AbstractClass
  actionA: () => 
    print 'action A is taken'
    return
  actionB: () => 
    print 'action B is taken'
    return

class StaticAbstractClass
  @process: () =>
    cls = @()
    cls\actionA()
    cls\actionB()
    return
  actionA: () =>
  actionB: () =>
class StaticConcreteClass extends StaticAbstractClass
  actionA: () => 
    print 'action A is taken'
    return
  actionB: () => 
    print 'action B is taken'
    return

class Main
  @run: () =>
    clsA = ConcreteClass()
    clsA\process()
    
    StaticConcreteClass\process()
    return

Main.run()

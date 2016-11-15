class AbstractImplementor
  implement: () =>
class ConcreteImplementorA extends AbstractImplementor
  implement: () => 
    print 'ConcreteImplementorA implement'
    return
class ConcreteImplementorB extends AbstractImplementor
  implement: () => 
    print 'ConcreteImplementorB implement'
    return

class AbstractExecutor
  new: ( @imp ) =>
  execute: () => 
    @imp\implement()
    return
class ConcreteExecutor extends AbstractExecutor

class Main
  @run: () =>
    ConcreteImplementorA = ConcreteImplementorA()
    refinedExecutorA = ConcreteExecutor( ConcreteImplementorA )
    refinedExecutorA\execute()
    ConcreteImplementorB = ConcreteImplementorB()
    refinedExecutorB = ConcreteExecutor( ConcreteImplementorB )
    refinedExecutorB\execute()
    return
    
Main.run()

class AbstractImplementor
  implement: ->
class ConcreteImplementorA extends AbstractImplementor
  implement: -> 
    console.log 'ConcreteImplementorA implement'
    return
class ConcreteImplementorB extends AbstractImplementor
  implement: -> 
    console.log 'ConcreteImplementorB implement'
    return

class AbstractExecutor
  constructor: ( @imp ) ->
  implement: -> 
    @imp.implement()
    return
class ConcreteExecutorA extends AbstractExecutor
class ConcreteExecutorB extends AbstractExecutor

class Main
  @run: ->
    ConcreteImplementorA = new ConcreteImplementorA()
    refinedExecutorA = new ConcreteExecutorA( ConcreteImplementorA )
    refinedExecutorA.implement()

    ConcreteImplementorB = new ConcreteImplementorB()
    refinedExecutorB = new ConcreteExecutorB( ConcreteImplementorB )
    refinedExecutorB.implement()
    return
    
Main.run()

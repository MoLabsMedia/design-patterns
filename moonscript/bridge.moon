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
  execute: -> 
    @imp.implement()
    return
class ConcreteExecutor extends AbstractExecutor

class Main
  @run: ->
    ConcreteImplementorA = new ConcreteImplementorA()
    refinedExecutorA = new ConcreteExecutor( ConcreteImplementorA )
    refinedExecutorA.execute()
    ConcreteImplementorB = new ConcreteImplementorB()
    refinedExecutorB = new ConcreteExecutor( ConcreteImplementorB )
    refinedExecutorB.execute()
    return
    
Main.run()

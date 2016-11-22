class AbstractImplementor
  implement: ->
class ConcreteImplementorA extends AbstractImplementor
  implement: -> 
class ConcreteImplementorB extends AbstractImplementor
  implement: -> 

class AbstractExecutor
  constructor: ( @imp ) ->
  implement: -> 
    @imp.implement()
    return
class ConcreteExecutorA extends AbstractExecutor
class ConcreteExecutorB extends AbstractExecutor

class Main
  @run: ->
    concrete_implementor_a = new ConcreteImplementorA()
    concrete_executor_a = new ConcreteExecutorA( concrete_implementor_a )
    concrete_executor_a.implement()

    concrete_implementor_b = new ConcreteImplementorB()
    concrete_executor_b = new ConcreteExecutorB( concrete_implementor_b )
    concrete_executor_b.implement()
    return
    
Main.run()

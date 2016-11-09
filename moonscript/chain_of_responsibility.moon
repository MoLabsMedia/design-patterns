class AbstractHandler
  constructor: ( @type, @next ) ->
  process: -> 
    if @next 
      @next.process()
    return
class ConcreteHandlerA extends AbstractHandler
  process: -> 
    super()
    console.log "#{ @type } handled"
    return
class ConcreteHandlerB extends AbstractHandler
  process: -> 
    super()
    console.log "#{ @type } handled"
    return

class Main
  @run: ->
    handlerA = new ConcreteHandlerA( 'first' )
    handlerB = new ConcreteHandlerB( 'second', handlerA )
    handlerB.process()
    return

Main.run()

class AbstractHandler
  new: ( @type, @next ) =>
  process: () => 
    if @next 
      @next\process()
    return
class ConcreteHandlerA extends AbstractHandler
  process: () => 
    super()
    print "#{ @type } handled"
    return
class ConcreteHandlerB extends AbstractHandler
  process: () => 
    super()
    print "#{ @type } handled"
    return

class Main
  @run: () =>
    handlerA = ConcreteHandlerA( 'first' )
    handlerB = ConcreteHandlerB( 'second', handlerA )
    handlerB\process()
    return

Main.run()

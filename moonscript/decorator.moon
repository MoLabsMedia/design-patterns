class AbstractComponent
  props: {}
  add: ( key, val ) => @props[ key ] = val
  get: () => @props
  process: () =>
    print 'default process'
    return
    
class ConcreteComponent extends AbstractComponent
  process: () =>
    print 'process through ConcreteComponent its self'
    super()
    return

class AbstractDecorator extends AbstractComponent
  new: ( @comp ) =>
  process: () => 
    @comp\process()
    return
class ConcreteDecoratorA extends AbstractDecorator
  process: () =>
    @comp\add( 'process through ConcreteDecoratorA', true )
    print 'add process through ConcreteDecoratorA'
    super()
    return
class ConcreteDecoratorB extends AbstractDecorator
  process: () =>
    @comp\add( 'process through ConcreteDecoratorB', true )
    print 'add process through ConcreteDecoratorB'
    super()
    return

class Main
  @run: () =>
    comp = ConcreteDecoratorA( ConcreteDecoratorB( ConcreteComponent() ) )
    comp\process()
    return

Main.run()

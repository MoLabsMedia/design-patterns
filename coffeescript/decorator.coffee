class AbstractComponent
  props: {}
  add: ( key, val ) -> @props[ key ] = val
  get: -> @props
  process: ->
    console.log 'default process'
    return
    
class ConcreteComponent extends AbstractComponent
  process: () ->
    console.log 'process through ConcreteComponent its self'
    super()
    return

class AbstractDecorator extends AbstractComponent
  constructor: ( @comp ) ->
  process: -> 
    @comp.process()
    return
class ConcreteDecoratorA extends AbstractDecorator
  process: ->
    @comp.add( 'process through ConcreteDecoratorA', true )
    console.log 'add process through ConcreteDecoratorA'
    super()
    return
class ConcreteDecoratorB extends AbstractDecorator
  process: ->
    @comp.add( 'process through ConcreteDecoratorB', true )
    console.log 'add process through ConcreteDecoratorB'
    super()
    return

class Main
  @run: ->
    comp = new ConcreteDecoratorA( new ConcreteDecoratorB( new ConcreteComponent() ) )
    comp.process()
    return

Main.run()

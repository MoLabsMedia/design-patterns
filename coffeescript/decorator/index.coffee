class Component
  props: {}
  add: ( key, val ) -> @props[ key ] = val
  get: -> @props
  process: ->

class ConcreteComponent extends Component
  process: ->

class Decorator extends Component
  constructor: ( @component ) ->
  process: -> @component.process()

class ConcreteDecoratorA extends Decorator
  process: ->
    @component.add 'concreteDecoratorAProcess', true
    super()
class ConcreteDecoratorB extends Decorator
  process: ->
    @component.add 'concreteDecoratorBProcess', true
    super()

class Example
  @run: ->
    cmpt = new ConcreteDecoratorA( new ConcreteDecoratorB( new ConcreteComponent() ) )
    cmpt.process()
Example.run()

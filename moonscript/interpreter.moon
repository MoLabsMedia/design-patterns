class Context
  constructor: ( @name ) ->

class AbstractExpression
  constructor: -> 
    @expressions = []
    return
  interpret: ( @context ) ->
class ConcreteExpressionA extends AbstractExpression
  interpret: ( @context ) -> 
    console.log "ConcreteExpressionA within #{ @context.name }"
    return
class ConcreteExpressionB extends AbstractExpression
  addExpression: ( expression ) -> 
    @expressions.push expression
    return
  interpret: ( @context ) ->
    console.log "ConcreteExpressionB within #{ @context.name }"
    for e in @expressions 
      e.interpret( @context )
    return

class Main
  @run: ->
    context = new Context( 'THE CONTEXT' )
    exp = new ConcreteExpressionB()
    exp.addExpression( new ConcreteExpressionA() )
    exp.addExpression( new ConcreteExpressionA() )
    exp.interpret( context )

Main.run()

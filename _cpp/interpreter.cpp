class Context
  constructor: ( @key  ) ->

class AbstractExpression
  expressions: []
  interpret: ( @context ) ->
class ConcreteExpressionA extends AbstractExpression
  interpret: ( @context ) -> 
class ConcreteExpressionB extends AbstractExpression
  addExpression: ( exp ) -> 
    @expressions.push exp
    return
  interpret: ( @context ) ->
    for e in @expressions 
      e.interpret( @context )
    return

class Main
  @run: ->
    exp_b = new ConcreteExpressionB()
    exp_b.addExpression( new ConcreteExpressionA() )
    exp_b.addExpression( new ConcreteExpressionA() )
    
    context = new Context( 'key' )
    exp_b.interpret( context )

Main.run()

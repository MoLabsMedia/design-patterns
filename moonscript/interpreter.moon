class Context
  new: ( @name ) =>

class AbstractExpression
  new: () => 
    @expressions = {}
    return
  interpret: ( @context ) =>
class ConcreteExpressionA extends AbstractExpression
  interpret: ( @context ) => 
    print "ConcreteExpressionA within #{ @context\name }"
    return
class ConcreteExpressionB extends AbstractExpression
  addExpression: ( expression ) => 
    @expressions\push expression
    return
  interpret: ( @context ) =>
    print "ConcreteExpressionB within #{ @context\name }"
    for e in @expressions 
      e\interpret( @context )
    return

class Main
  @run: () =>
    context = Context( 'THE CONTEXT' )
    exp = ConcreteExpressionB()
    exp\addExpression( ConcreteExpressionA() )
    exp\addExpression( ConcreteExpressionA() )
    exp\interpret( context )

Main.run()

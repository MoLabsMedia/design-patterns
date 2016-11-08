class Context
  constructor: ( @name ) ->
  getName: -> @name

class AbstractExpression
  constructor: -> @expressions = []
  interpret: ( @context ) ->

class TerminalExpression extends AbstractExpression
  interpret: ( @context ) -> console.log "Terminal expression for #{@context.getName()}"
class NonterminalExpression extends AbstractExpression
  addExpression: ( expression ) -> @expressions.push( expression )
  interpret: ( @context ) ->
    console.log "Nonterminal expression for #{@context.getName()}"
    for expression in @expressions then expression.interpret( @context )

class Client
  @run: ->
    context = new Context( '*le context' )
    root = new NonterminalExpression()
    root.addExpression( new TerminalExpression() )
    root.addExpression( new TerminalExpression() )
    root.interpret( context )
Client.run()

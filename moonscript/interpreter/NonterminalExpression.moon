import AbstractExpression from require 'AbstractExpression'
class NonterminalExpression extends AbstractExpression
  addExpression: ( expression ) => table.insert( @expressions, expression )
  interpret: ( @context ) =>
    print "Nonterminal expression for #{@context\getName()}"
    for i, expression in ipairs( @expressions ) 
      expression\interpret( @context )
    return

{ :NonterminalExpression }

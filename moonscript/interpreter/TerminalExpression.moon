import AbstractExpression from require 'AbstractExpression'
class TerminalExpression extends AbstractExpression
  interpret: ( @context ) => print "Terminal expression for #{@context\getName()}"

{ :TerminalExpression }

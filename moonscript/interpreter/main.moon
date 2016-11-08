import Context from require 'Context'
import NonterminalExpression from require 'NonterminalExpression'
import TerminalExpression from require 'TerminalExpression'
class Client
  run: () =>
    context = Context( '*le context' )
    root = NonterminalExpression()
    root\addExpression( TerminalExpression() )
    root\addExpression( TerminalExpression() )
    root\interpret( context )
    return

Client\run()

import Receiver from require 'Receiver'
import ConcreteCommandA from require 'ConcreteCommandA'
import ConcreteCommandB from require 'ConcreteCommandB'
import Invoker from require 'Invoker'
class Client
  run: ( action ) =>
    receiver = Receiver()
    ccmdA = ConcreteCommandA( receiver )
    ccmdB = ConcreteCommandB( receiver )
    invoker = Invoker()
    invoker\execute( ccmdA ) if action == 1
    invoker\execute( ccmdB ) if action == 2

{ :Client }

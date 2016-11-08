import ConcreteHandler1 from require 'ConcreteHandler1'
import ConcreteHandler2 from require 'ConcreteHandler2'
class Client
  run: =>
    concreteHandler1 = ConcreteHandler1( 'foo' )
    concreteHandler2 = ConcreteHandler2( 'bar', concreteHandler1 )
    concreteHandler2\handleRequest()
Client\run()

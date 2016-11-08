class Handler
  constructor: ( @kind, @successor ) ->
  handleRequest: -> if @successor then @successor.handleRequest()

class ConcreteHandler1 extends Handler
  handleRequest: -> console.log "#{@kind} handled"
class ConcreteHandler2 extends Handler

class Client
  @run: ->
    concreteHandler1 = new ConcreteHandler1( 'foo' )
    concreteHandler2 = new ConcreteHandler2( 'bar', concreteHandler1 )
    concreteHandler2.handleRequest()
Client.run()

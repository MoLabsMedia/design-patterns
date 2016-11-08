class Command
  execute: ->

class Invoker
  execute: ( command ) -> command.execute()

class Receiver
  action1: -> console.log 'action1'
  action2: -> console.log 'action2'

class ConcreteCommandA extends Command
  constructor: ( @receiver ) ->
  execute: -> @receiver.action1()
class ConcreteCommandB extends Command
  constructor: ( @receiver ) ->
  execute: -> @receiver.action2()

class Client
  @run: ( action ) ->
    receiver = new Receiver()
    ccmdA = new ConcreteCommandA( receiver )
    ccmdB = new ConcreteCommandB( receiver )
    invoker = new Invoker()
    invoker.execute( ccmdA ) if action is 1
    invoker.execute( ccmdB ) if action is 2

class Example
  @run: ->
    Client.run( 1 )
    Client.run( 2 )
Example.run()

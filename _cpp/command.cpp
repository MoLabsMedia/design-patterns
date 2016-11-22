class AbstractCommand
  process: ->
class ConcreteCommandA extends AbstractCommand
  constructor: ( @receiver ) ->
  process: -> 
    @receiver.doThis()
    return
class ConcreteCommandB extends AbstractCommand
  constructor: ( @receiver ) ->
  process: -> 
    @receiver.doThat()
    return

class Receiver
  doThis: -> 
  doThat: -> 

class Invoker
  process: ( cmd ) -> 
    cmd.process()
    return

class Main
  @run: ( key ) ->
    receiver = new Receiver()
    cmd_a = new ConcreteCommandA( receiver )
    cmd_b = new ConcreteCommandB( receiver )
    invoker = new Invoker()
    switch key
      when 'rock'
        invoker.process( cmd_a )
      when 'paper'
        invoker.process( cmd_b )
      else
        console.log 'no command to process'
    return

Main.run( 'rock' )
Main.run( 'paper' )

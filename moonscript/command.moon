class AbstractCommand
  run: ->
class ConcreteCommandA extends AbstractCommand
  constructor: ( @receiver ) ->
  run: -> @receiver.doThis()
class ConcreteCommandB extends AbstractCommand
  constructor: ( @receiver ) ->
  run: -> @receiver.doThat()

class Receiver
  doThis: -> 
    console.log 'do this'
    return
  doThat: -> 
    console.log 'do that'
    return

class Invoker
  run: ( cmd ) -> 
    cmd.run()
    return

class Main
  @run: ( type ) ->
    receiver = new Receiver()
    cmdA = new ConcreteCommandA( receiver )
    cmdB = new ConcreteCommandB( receiver )
    invoker = new Invoker()
    switch type
      when 'a'
        invoker.run( cmdA )
      when 'b'
        invoker.run( cmdB )
      else
        console.log 'no command to run'
    return

Main.run( 'a' )
Main.run( 'b' )

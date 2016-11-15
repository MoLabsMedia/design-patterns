class AbstractCommand
  run: () =>
class ConcreteCommandA extends AbstractCommand
  new: ( @receiver ) =>
  run: () => @receiver\doThis()
class ConcreteCommandB extends AbstractCommand
  new: ( @receiver ) =>
  run: () => @receiver\doThat()

class Receiver
  doThis: () => 
    print 'do this'
    return
  doThat: () => 
    print 'do that'
    return

class Invoker
  run: ( cmd ) => 
    cmd\run()
    return

class Main
  @run: ( type ) =>
    receiver = Receiver()
    cmdA = ConcreteCommandA( receiver )
    cmdB = ConcreteCommandB( receiver )
    invoker = Invoker()
    switch type
      when 'a'
        invoker\run( cmdA )
      when 'b'
        invoker\run( cmdB )
      else
        print 'no command to run'
    return

Main\run( 'a' )
Main\run( 'b' )

class Adaptee
  doSomething: -> 

class Interface
  process: -> 
class Adapter extends Interface
  constructor: ( @adaptee ) ->
  process: -> 
    @adaptee.doSomething()
    return

class Main
  @run: ->
    adaptee = new Adaptee()
    adapter = new Adapter( adaptee )
    adapter.process()
    return

Main.run()

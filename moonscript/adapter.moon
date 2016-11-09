class Adaptee
  request: -> 
    console.log 'Adaptee request'
    return

class Target
  request: -> 
    console.log 'default request'
    return
class Adapter extends Target
  constructor: ( @adaptee ) ->
  request: -> 
    @adaptee.request()
    return

class Main
  @run: ->
    adaptee = new Adaptee()
    adapter = new Adapter( adaptee )
    adapter.request()
    return

Main.run()

class Adaptee
  specificRequest: -> console.log 'Specific request'
class Target
  request: -> console.log 'Not fired'
class Adapter extends Target
  constructor: ( @adaptee ) ->
  request: -> @adaptee.specificRequest()
class Client
  @run: ->
    adaptee = new Adaptee()
    adapter = new Adapter( adaptee )
    adapter.request()

Client.run()

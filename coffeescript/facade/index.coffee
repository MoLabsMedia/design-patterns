class Subsystem1
  constructor: -> console.log 'subsystem1'
class Subsystem2
  constructor: -> console.log 'subsystem2'

class Facade
  request: ->
    s1 = new Subsystem1()
    s2 = new Subsystem2()

class Client
  @run: ->
    facade = new Facade()
    facade.request()
Client.run()

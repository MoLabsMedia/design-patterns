class AbstractSubject
  request: ->

class ConcreteSubject extends AbstractSubject
  request: -> 
    console.log 'from Concrete subject'
    return

class Proxy extends AbstractSubject
  request: ->
    @sub ||= new ConcreteSubject()
    @sub.request()
    return

class Main
  @run: ->
    proxy = new Proxy()
    proxy.request()

Main.run()

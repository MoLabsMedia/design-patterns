class AbstractSubject
  process: ->
class ConcreteSubject extends AbstractSubject
  process: -> 
class Proxy extends AbstractSubject
  process: ->
    @sub ?= new ConcreteSubject()
    @sub.process()
    return

class Main
  @run: ->
    proxy = new Proxy()
    proxy.process()

Main.run()

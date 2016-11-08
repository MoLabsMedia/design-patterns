class Subject
  request: ->
class RealSubject extends Subject
  request: -> console.log 'Real subject'

class Proxy extends Subject
  request: ->
    @realSubject ||= new RealSubject()
    @realSubject.request()

class Client
  @run: ->
    proxy = new Proxy()
    proxy.request()
Client.run()

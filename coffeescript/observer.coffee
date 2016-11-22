class AbstractObserver
  update: ( sbj ) ->
class ConcreteObserver extends AbstractObserver
  update: ( sbj ) -> 

class AbstractSubject
  constructor: ->
    @pointer = 0
    @observers = new List()
    return
  addObserver: ( obs ) ->
    obs.__POINTER__ = @pointer
    @observers.append( obs )
    @pointer += 1
    return
  removeObserver: ( obs ) ->
    @observers.remove( obs )
    return
  notify: ->
    obss_it = new ConcreteIterator( @observers )
    while not obss_it.isDone()
      obss_it.current().update( @ )
      obss_it.next()
    return
class ConcreteSubject extends AbstractSubject
      
class Main
  @run: ->
    sbj = new ConcreteSubject()
    obsA = new ConcreteObserver()
    obsB = new ConcreteObserver()
    sbj.addObserver( obsA )
    sbj.addObserver( obsB )
    sbj.notify()

Main.run()

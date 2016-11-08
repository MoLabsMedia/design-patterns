class Subject
  constructor: ->
    @counter = 0
    @observers = new List()
  attach: ( o ) ->
    o.__POINTER__ = @counter
    @observers.append( o )
    @counter += 1
  detach: ( o ) ->
    @observers.remove( o )
  notify: ->
    i = new ConcreteIterator( @observers )
    while not i.isDone()
      i.currentItem().update( @ )
      i.next()
class ConcreteSubject extends Subject
      
class Observer
  update: ( theChangedSubject ) ->
class ConcreteObserver extends Observer
  update: ( theChangedSubject ) -> console.log 'Updated'

class Example
  @run: ->
    subject = new ConcreteSubject()
    observer1 = new ConcreteObserver()
    observer2 = new ConcreteObserver()
    subject.attach( observer1 )
    subject.attach( observer2 )
    subject.notify()
Example.run()

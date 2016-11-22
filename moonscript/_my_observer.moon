class AbstractSubject
  new: () =>
    @pointer = 0
    @observers = List()
    return
  addObserver: ( obs ) =>
    obs\__POINTER__ = @pointer
    @observers\append( obs )
    @pointer += 1
    return
  removeObserver: ( obs ) =>
    @observers\remove( obs )
    return
  notify: () =>
    obss_it = ConcreteIterator( @observers )
    while not obss_it\isDone()
      obss_it\current()\update( @ )
      obss_it\next()
    return
class ConcreteSubject extends AbstractSubject
      
class AbstractObserver
  update: ( sbj ) =>
class ConcreteObserver extends AbstractObserver
  update: ( sbj ) => 
    print 'Updated'
    return

class Main
  @run: () =>
    sbj = ConcreteSubject()
    obsA = ConcreteObserver()
    obsB = ConcreteObserver()
    sbj\addObserver( obsA )
    sbj\addObserver( obsB )
    sbj\notify()

Main.run()

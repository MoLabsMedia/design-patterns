class AbstractSubject
  request: () =>

class ConcreteSubject extends AbstractSubject
  request: () => 
    print 'from Concrete subject'
    return

class Proxy extends AbstractSubject
  request: () =>
    @sub ||= ConcreteSubject()
    @sub\request()
    return

class Main
  @run: () =>
    proxy = Proxy()
    proxy\request()

Main.run()

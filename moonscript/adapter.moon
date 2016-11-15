class Adaptee
  request: () => 
    print 'Adaptee request'
    return

class Target
  request: () => 
    print 'default request'
    return
class Adapter extends Target
  new: ( @adaptee ) =>
  request: () => 
    @adaptee\request()
    return

class Main
  @run: () =>
    adaptee = Adaptee()
    adapter = Adapter( adaptee )
    adapter\request()
    return

Main.run()

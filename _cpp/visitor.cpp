class AbstractAccepter
  accept: ( visitor ) ->
class ConcreteAccepterA
  accept: ( visitor ) ->
    visitor.visit( this )
    return
  doThis: () ->
class ConcreteAccepterB
  accept: ( visitor ) ->
    visitor.visit( this )
    return
  doThis: () ->

class AbstractVisitor
  visit: ( accepter ) ->
class ConcreteVisitorA
  visit: ( accepter ) ->
    accepter.doThis()
    return
class ConcreteVisitorB
  visit: ( accepter ) ->
    accepter.doThis()
    return

class Main
  @run: () ->
    accepter_a = new ConcreteAccepterA()
    accepter_b = new ConcreteAccepterB()
    visitor_a = new ConcreteVisitorA()
    visitor_b = new ConcreteVisitorB()
    accepter_a.accept( visitor_a )
    accepter_b.accept( visitor_b )
    return

Main.run()

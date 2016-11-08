import Handler from require 'Handler'
class ConcreteHandler1 extends Handler
  handleRequest: => print "#{ @kind } handled"

{ :ConcreteHandler1 }

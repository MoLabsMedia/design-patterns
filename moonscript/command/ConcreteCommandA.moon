import Command from require 'Command'
class ConcreteCommandA extends Command
  new: ( @receiver ) =>
  execute: () => @receiver\action1()

{ :ConcreteCommandA }

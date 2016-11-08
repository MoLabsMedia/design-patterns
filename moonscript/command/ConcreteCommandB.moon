import Command from require 'Command'
class ConcreteCommandB extends Command
  new: ( @receiver ) =>
  execute: () => @receiver\action2()

{ :ConcreteCommandB }

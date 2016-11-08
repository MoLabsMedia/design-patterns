import ConcreteMediator from require 'ConcreteMediator'
class Example
  run: () =>
    m = ConcreteMediator()
    m\createColleagues()

Example\run()

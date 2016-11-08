import Subsystem1 from require 'Subsystem1'
import Subsystem2 from require 'Subsystem2'
class Facade
  request: () =>
    s1 = Subsystem1()
    s2 = Subsystem2()

{ :Facade }

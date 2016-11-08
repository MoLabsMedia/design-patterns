import Client from require 'Client'
import ConcretePrototype1 from require 'ConcretePrototype1'
class Example
  run: () =>
    client = Client()
    cp1 = ConcretePrototype1()
    cp1Prototype = client.operation cp1
    cp1.setProperty 'original1'
    cp1Prototype.setProperty 'clone1'
    cp1.logProperty()
    cp1Prototype.logProperty()
    return

Example.run()

import Adaptee from require 'Adaptee'
import Adapter from require 'Adapter'
class Client
  run: () =>
    adaptee = Adaptee()
    adapter = Adapter( adaptee )
    adapter\request()

Client\run()

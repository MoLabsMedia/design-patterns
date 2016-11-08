import Facade from require 'Facade'
class Client
  run: () =>
    facade = Facade()
    facade\request()
Client\run()

import Proxy from require 'Proxy'
class Client
  run: () =>
    proxy = Proxy()
    proxy\request()

Client\run()

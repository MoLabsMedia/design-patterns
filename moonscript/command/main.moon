import Client from require 'Client'
class Example
  run: () =>
    Client\run( 1 )
    Client\run( 2 )

Example\run()

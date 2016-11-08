import ConcreteBuilder from require 'ConcreteBuilder'
import Director from require 'Director'
class Client
  run: () =>
    concreteBuilder = ConcreteBuilder()
    director = Director( concreteBuilder )
    director\construct( { 'ohai' } )
    result = concreteBuilder\getResult()
    print result\get()
Client\run()

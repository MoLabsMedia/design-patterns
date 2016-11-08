import FlyweightFactory from require 'FlyweightFactory'
class Client
  run: () =>
    factory = FlyweightFactory()
    foo = factory\getFlyweight( 'foo' )
    bar = factory\getFlyweight( 'bar' )
    baz = factory\getFlyweight( 'baz' )
    qux = factory\getFlyweight( 'foo' )
    foo\operation( 'red' )
    bar\operation( 'green' )
    baz\operation( 'blue' )
    qux\operation( 'black' )
    return

Client\run()

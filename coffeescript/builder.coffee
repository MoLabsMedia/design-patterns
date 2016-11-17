class Part
  constructor: () ->
    console.log 'It is a part.'
    return
class Head extends Part
  constructor: () ->
    console.log 'It is the head.'
    return this
class Body extends Part
  constructor: () ->
    console.log 'It is the body.'
    return this
class Tail extends Part
  constructor: () ->
    console.log 'It is the tail.'
    return this

class Product
  constructor: -> 
    @parts = []
    return
  addPart: ( part ) -> 
    switch part
      when 'head'
        @parts.push new Head()
      when 'body'
        @parts.push new Body()
      when 'tail'
        @parts.push new Tail()
      else
        console.log 'can not add ' + part
    return
  show: () -> return @parts

class AbstractBuilder
  addPart: ->
class ConcreteBuilder extends AbstractBuilder
  constructor: -> 
    @product = new Product()
    return
  addPart: ( part ) -> 
    @product.addPart( part )
    return
  getProduct: -> return @product

class Assembler
  constructor: ( @builder ) ->
  assemble: ( parts ) ->
    for part in parts
      @builder.addPart( part )
    return

class Client
  @run: ->
    concreteBuilder = new ConcreteBuilder()
    assembly = new Assembler( concreteBuilder )
    assembly.assemble( [ 'head', 'body', 'tail' ] )
    product = concreteBuilder.getProduct()
    console.log product.show()
    return

Main.run()

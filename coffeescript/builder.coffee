class Part
class Head extends Part
class Body extends Part
class Tail extends Part

class Product
  parts: []
  addPart: ( part ) -> 
    switch part
      when 'head'
        @parts.push new Head()
      when 'body'
        @parts.push new Body()
      when 'tail'
        @parts.push new Tail()
      else
        console.log 'there is no such part.'
    return
  display: () -> return @parts

class AbstractBuilder
  addPart: ->
class ConcreteBuilder extends AbstractBuilder
  product: new Product()
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

class Main
  @run: ->
    concrete_builder = new ConcreteBuilder()
    assembler = new Assembler( concrete_builder )
    parts = [ 'head', 'body', 'tail' ]
    assembler.assemble( parts )
    product = concrete_builder.getProduct()
    console.log product.display()
    return

Main.run()

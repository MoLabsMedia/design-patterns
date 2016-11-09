class Product
  constructor: -> 
    @final_product = []
    return
  addPart: ( part ) -> 
    @final_product.push part
    return
  display: () -> 
    return @final_product

class AbstractBuilder
  buildPart: ->
class ConcreteBuilder extends AbstractBuilder
  constructor: -> 
    @product = new Product()
    return
  buildPart: ( part ) -> 
    @product.addPart( part )
    return
  getProduct: -> 
    return @product

class Assembler
  constructor: ( @builder ) ->
  assemble: ( parts ) ->
    for part in parts
      @builder.buildPart( part )
    return

class Client
  @run: ->
    concreteBuilder = new ConcreteBuilder()
    assembly = new Assembler( concreteBuilder )
    assembly.assemble( [ 'head', 'body', 'tail' ] )
    product = concreteBuilder.getProduct()
    console.log product.display()
    return

Main.run()

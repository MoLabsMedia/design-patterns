class Product
  new: () => 
    @final_product = {}
    return
  addPart: ( part ) => 
    @final_product\push part
    return
  display: () => 
    return @final_product

class AbstractBuilder
  buildPart: () =>
class ConcreteBuilder extends AbstractBuilder
  new: () => 
    @product = Product()
    return
  buildPart: ( part ) => 
    @product\addPart( part )
    return
  getProduct: () => 
    return @product

class Assembler
  new: ( @builder ) =>
  assemble: ( parts ) =>
    for _, part in ipairs( parts )
      @builder\buildPart( part )
    return

class Client
  @run: () =>
    concreteBuilder = ConcreteBuilder()
    assembly = Assembler( concreteBuilder )
    assembly\assemble( [ 'head', 'body', 'tail' ] )
    product = concreteBuilder\getProduct()
    print product\display()
    return

Main.run()

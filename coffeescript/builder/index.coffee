class Product
  constructor: -> @result = ''
  append: ( obj ) -> @result += obj
  get: -> @result

class AbstractBuilder
  buildPart: ->

class ConcreteBuilder extends AbstractBuilder
  constructor: -> @product = new Product()
  buildPart: ( obj ) -> @product.append( obj.toUpperCase() )
  getResult: -> @product

class Director
  constructor: ( @builder ) ->
  construct: ( structure ) ->
    for obj in structure
      console.log obj
      @builder.buildPart( obj )
    return

class Client
  @run: ->
    concreteBuilder = new ConcreteBuilder()
    director = new Director( concreteBuilder )
    director.construct( [ 
     'ohai' 
    ] )
    result = concreteBuilder.getResult()
    alert( result.get() )
Client.run()

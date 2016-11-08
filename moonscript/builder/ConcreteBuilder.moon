import AbstractBuilder from require 'AbstractBuilder'
import Product from require 'Product'
class ConcreteBuilder extends AbstractBuilder
  new: () => @product = Product()
  buildPart: ( obj ) => @product\append( obj\upper() )
  getResult: () => @product

{ :ConcreteBuilder }

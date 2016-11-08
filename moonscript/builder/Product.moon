class Product
  new: () => @result = ''
  append: ( obj ) => @result ..= obj
  get: () => @result

{ :Product }

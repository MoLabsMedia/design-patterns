class Client
  new: ( factory ) =>
    @abstractProductA = factory.createProductA()
    @abstractProductB = factory.createProductB()

{ :Client }

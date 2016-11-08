import Composite from require 'Composite'
import Leaf from require 'Leaf'
class Client
  run: () =>
    -- Create a Composite object and add a Leaf
    composite = Composite()
    leaf = Leaf()
    composite\add( leaf )
    composite\operation()
    -- Add a Composite to the Composite
    composite2 = Composite()
    composite\add( composite2 )
    composite\operation()
    return

Client\run()

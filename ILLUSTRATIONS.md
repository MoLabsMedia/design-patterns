## Creational patterns
### Abstract Factory
```coffeescript
Info_x extends INFO
Proc_x extends PROC # proc_x( info_x )
Wrapper_Proc # wrapper_proc( proc_x )
```

- abstract product generate concrete products
- abstract factory generate concrete factories
  - concrete factory methods instantiate concrete products
- a procedure instantiate concrete factory to 'produce/build/make' some products

### Builder
```coffeescript
Info_x extends INFO
Wrapper_Info # wrapper_info( info_x_key )
Proc # proc( wrapper_info )
Wrapper_Proc # wrapper_proc( proc )
```

- abstract part generate concrete parts
- a product use methods to instantiate concrete parts
- a factory use the product methods to generate parts and provide method to assemble the final product
- a procedure instantiate factory to 'produce/build/make' a product

### Factory Method
```coffeescript
Info_x extends INFO
Proc # proc( info_x_key )
```

- abstract product generate concrete products
- a factory method instantiate different products according to a 'token/key/id' as a parameter to 'produce/build/make' a product

### Prototype 
```coffeescript
Info # info.clone -> return _infos
```

- a product provide method to 'clone/copy/duplicate' itsself to lessen the costly creation procedure

### Singleton
```coffeescript
Proc # Proc.getInstance( Info )
  # _info ?= new Info()
```

- a product provide static method to check existence of its instance and instantiate if not exist

## Structural patterns
### Adapter
```coffeescript
Proc # proc.process()
Wrapper_Proc # wrapper_proc( proc ), wrapper_proc.process( proc.process() )
```

- product has a unique method
- adapter instantiate product and extends an interface with a common method which call the product's unique method

### Bridge
```coffeescript
Proc_x extends PROC
Wrapper_Proc_x extends WRAPPER_PROC # wrapper_proc_x( proc_x ), wrapper_proc_x.process( proc_x.process() )
```

- abstract procedure generate concrete procedures
- abstract executor generate concrete executors
- each concrete executor instantiate a concrete procedure and provide method to call concrete procedure's relative method

### Composite
```coffeescript
Single_Info extends INFO
Group_Info extends INFO # group_info.add( info )
```

- abstract product generate single product and group product
- group product provide method to add other abstract product type of product, which is either sigle product or group product

### Decorator
```coffeescript
Info_x extends INFO # info_x.process( INFO.process() )
Info_x_x extends Info_x # info_x_x( info_x ), info_x_x.process( info_x.process() )
```

- abstract product generate abstract decorating product
- abstract decorating product instantiate with a type of abstract product as parameter and calls the product's method with its relative method
- abstract decorating product generate concrete decorating product and calls abstract decorating product's method with its relative method, therefore indirectly calls the incoporated abstract product in instantiation

### Facade
```coffeescript
Info_x extends INFO
Proc # proc.process( info_x.process() )
```

- abstract product generate concrete products
- facade use simple method to instantiate concrete products and achieve certain funtion by calling usually combination of their trivial methods

### Flyweight
```coffeescript
Info
Proc # proc( info[n] ), proc.process( info_key ){ if info[ info_key ] ?= new Info() }
```

- flyweight instantiate with a unique key as parameter
- flyweight factory keeps a table of flyweight's instances and provide method to get flyweight according to a key as parameter, in this case to avoid repetitive flyweight of the same key

### Proxy
```coffeescript
Proc extends PROC
Wrapper_Proc extends PROC # wrapper_proc.process( proc.process() ){ if proc ?= new Proc() }
```

- abstract product generate concrete product and proxy
- proxy keep singleton of concrete product's instance to avoid repetitive instantiation
- proxy call concrete product's methods from its own

#### NOTE:

- Adapter makes things work after they're designed 
- Bridge makes them work before they are

- Bridge is designed up-front to let the abstraction and the implementation vary independently
- Adapter is retrofitted to make unrelated classes work together

- Adapter provides a different interface to its subject
- Proxy provides the same interface
- Decorator provides an enhanced interface

- Adapter is meant to change the interface of an existing object
- Decorator enhances another object without changing its interface
- Decorator is thus more transparent to the application than an adapter is. As a consequence, Decorator supports recursive composition, which isn't possible with pure Adapters.

- Facade defines a new interface 
- Adapter reuses an old interface
- Adapter makes two existing interfaces work together as opposed to defining an entirely new one.

- State, Strategy, Bridge (and to some degree Adapter) have similar solution structures. They all share elements of the "handle/body" idiom. They differ in intent - that is, they solve different problems.

## Behavioral patterns
### Chain of responsibility
```coffeescript
PROC # PROC.process(){ if proc_x_next? then proc_x_next.process() }
Proc_x extends PROC # proc_x( proc_x_next )
```

- abstract procedure generate concrete procedures, instantiates with a 'token/key/id' and a 'next' instance of itsself and provide a common method to check if the 'next' instance existence, if so just execute the 'next's' same method
- concrete procedure provide the common method as abstract procedure and calls parent's same method

### Command
```coffeescript
Info
Proc_x extends PROC # proc_x( info ), proc_x.process( info.process() )
Wrapper_Proc # wrapper_proc( proc_x ), wrapper_proc.process( proc_x.process() )
```

- abstract command generate concrete commands
- concrete command instantiates with a receiver instance and provide method to call receiver's relative method
- receiver provide relative methods
- invoker provide method with concrete command instance as parameter and calls concrete command's relative method
- in application, a 'token/key/id' is provided to switch between different concrete command instance as parameter when calling invoker's process method

### Interpreter
```coffeescript
Context_Info_x extends CONTEXT_INFO
Info_x extends INFO # info_x.process( context_info_x )
```

- context instantiates with a 'token/key/id' as an identifier
- abstract expression generates concrete expressions, keeps a table a expresstion instances, and provide a common method to 'interpret' with a context instance as parameter
- concrete expresstion provide method to add expresstion and its own version of 'interpret' method with a context instance parameter
- concrete expresstion is like a composite, which can add other concrete expresstion(s)
- when every expression has been added to a general expresstion and the final one can execute its 'interpret' method with a convenient context instance

### Iterator
```coffeescript
Proc # proc( some_collection ), proc._pointer, proc.isEmpty(), proc.next()
```

- abstract iterator provide methods like: 'first', 'last', 'next', 'current', 'isDone/isEmpty'
- abstract iterator generate concrete iterators
- concrete iterator instantiates with a collection, keeps a 'current' pointer private property, and provide its own versions of 'first', 'last', 'next', 'current', 'isDone/isEmpty'
- aggregator provides a method 'createIterator' with a collection as parameter and return an instance of concrete iterator
- in application, a while loop can be applied to check whether 'iterator.isDone()', therefore get 'iterator.current()' and moveforward with 'iterator.next()'

### Mediator
```coffeescript
Info_x extends INFO # info_x( proc ), info_x.process( proc.process( info_x ) )
Proc # proc( info_x ), proc.process( info_x ){ switch info_x }
```

- abstract colleague/peer instantiates with a mediator instance and provide a common method to call mediator's relative method with concrete colleague/peer instance as parameter
- abstract colleague/peer generate concrete colleague/peers
- mediator instantiates concrete colleague/peers and provide method with concrete colleague/peer as parameter and switch between different concrete colleague/peers

### Memento
```coffeescript
Info # info( data )
Proc # proc( data ), proc.save(){ return info( data ) }, proc.restore( info ){ proc.data = info.data }
```

- memento instantiates with a 'property/state' and provide method to retrieve the property
- originator instantiates with a 'property/state' and provide method to instantiate memento with its property, set value to its property with memento instance as parameter, and method to retrieve the property
- caretaker instantiates with originator instance, and provide method to save memento locally in order to provide mehtod to 'undo/rollback' former 'property value/state' by gettin value from the Memento


### Observer
```coffeescript
Info # info.process()
Proc # proc.add( _infos.push info ), proc.process( _infos.each _info.process() )
```

- abstract observer generates concrete observers and provide a common method to update itsself
- subject keeps a table of concrete observers and provides methods of 'register/add' concrete observer and 'unregister/remove' concrete observer, 'notify/broadcast' to all registered concrete observer instances

### State
```coffeescript

```

- abstract state generates concrete states and provide common methods
- concrete state instantiates with a state wrapper instance as parameter and provides its own version of the common methods
- state wrapper keeps instances of concrete states and a local 'current' state pointer and provides methods to call 'current'/some/all of the concrete state instances' methods

### Strategy
```coffeescript
Info_x extends INFO
Proc # proc( info_x ), proc.process( info_x.process() )
```

- abstract strategy generates concrete strategies
- concrete strategy provides algorithm and mehtod to 'apply' it
- context instantiates with concrete strategy instance and provide method to apply algorithm by calling concrete strategy's relative method

### Template method
```coffeescript

```

- abstract procedures generates concrete procedures, provide a series of 'hook' procedure methods and call them in a template 'process' method
- concrete procedures provide their own versions of the 'hook' procedure methods to inluence the 'process' by the default template method

### Visitor
```coffeescript

```

- abstract visitor generates concrete visitors and provide a common 'visit' method with a concrete accepter instance as parameter
- concrete visitor provides its own version of 'visit' method and calls the concrete accepter's method(s)
- abstract accepter generates concrete accepters and provide a common 'accept' method with a concrete visitor instance as parameter
- concrete accepter provides its own version of 'accept' method and calls the concrete visitor's 'visit' method

#### NOTE:

- mediator: many to many
- observer: one to many
- Chain of Responsibility, Command, Mediator, and Observer, address how you can decouple senders and receivers, but with different trade-offs. Chain of Responsibility passes a sender request along a chain of potential receivers.
- Command and Memento act as magic tokens to be passed around and invoked at a later time. In Command, the token represents a request; in Memento, it represents the internal state of an object at a particular time.
- Iterator can traverse a Composite. Visitor can apply an operation over a Composite.
- Chain of Responsibility, Command, Mediator, and Observer, address how you can decouple senders and receivers, but with different trade-offs. Chain of Responsibility passes a sender request along a chain of potential receivers. Command normally specifies a sender-receiver connection with a subclass. Mediator has senders and receivers reference each other indirectly. Observer defines a very decoupled interface that allows for multiple receivers to be configured at run-time.
- Mediator and Observer are competing patterns. The difference between them is that Observer distributes communication by introducing "observer" and "subject" objects, whereas a Mediator object encapsulates the communication between other objects. We've found it easier to make reusable Observers and Subjects than to make reusable Mediators.
- Mediator is similar to Facade in that it abstracts functionality of existing classes. Mediator abstracts/centralizes arbitrary communication between colleague objects, it routinely "adds value", and it is known/referenced by the colleague objects (i.e. it defines a multidirectional protocol). In contrast, Facade defines a simpler interface to a subsystem, it doesn't add new functionality, and it is not known by the subsystem classes (i.e. it defines a unidirectional protocol where it makes requests of the subsystem classes but not vice versa).
- 



#### NOTE:

`upper case` -> abstract classes

`camel case` -> concrete/normal classes

`lower case` -> class instances

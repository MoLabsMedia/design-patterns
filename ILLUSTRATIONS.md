## Creational patterns
### Abstract Factory
```coffeescript
Info_x extends INFO
Proc_x extends PROC # proc_x( info_x )
Wrapper_Proc # wrapper_proc( proc_x )
```

### Builder
```coffeescript
Info_x extends INFO
Wrapper_Info # wrapper_info( token_info_x )
Proc # proc( wrapper_info )
Wrapper_Proc # wrapper_proc( proc )
```

### Factory Method
```coffeescript
Info_x extends INFO
Proc # proc( token_info_x )
```

### Object Pool
```coffeescript

```

### Prototype
```coffeescript
Info # info.clone -> return _info
```

### Singleton
```coffeescript
Proc # Proc.getInstance( Info )
  # _info ?= new Info()
```

## Structural patterns
### Adapter
```coffeescript
Proc # proc.process()
Wrapper_Proc # wrapper_proc( proc ), wrapper_proc.process( proc.process() )
```

### Bridge
```coffeescript
Proc_x extends PROC
Wrapper_Proc_x extends WRAPPER_PROC # wrapper_proc_x( proc_x ), wrapper_proc_x.process( proc_x.process() )
```

### Composite
```coffeescript
Single_Info extends INFO
Group_Info extends INFO # group_info.add( info )
```

### Decorator
```coffeescript
Info_x extends INFO # info_x.process( INFO.process() )
Info_x_x extends Info_x # info_x_x( info_x ), info_x_x.process( info_x.process() )
```

### Facade
```coffeescript
Info_x extends INFO
Proc # proc.process( info_x.process() )
```

### Flyweight
```coffeescript
Info
Proc # proc( info[n] ), proc.process( token_info ){ if info[ token_info ] ?= new Info() }
```

### Private Class Data
```coffeescript

```

### Proxy
```coffeescript
Proc extends PROC
Wrapper_Proc extends PROC # wrapper_proc.process( proc.process() ){ if proc ?= new Proc() }
```

## Behavioral patterns
### Chain of responsibility
```coffeescript
PROC # PROC.process(){ if proc_x_next? then proc_x_next.process() }
Proc_x extends PROC # proc_x( proc_x_next )
```

### Command
```coffeescript
Info
Proc_x extends PROC # proc_x( info ), proc_x.process( info.process() )
Wrapper_Proc # wrapper_proc( proc_x ), wrapper_proc.process( proc_x.process() )
```

### Interpreter
```coffeescript
Context_Info_x extends CONTEXT_INFO
Info_x extends INFO # info_x.process( context_info_x )
```

### Iterator
```coffeescript
Proc # proc( some_collection ), proc._pointer, proc.isEmpty(), proc.next()
```

### Mediator
```coffeescript
Info_x extends INFO # info_x( proc ), info_x.process( proc.process( info_x ) )
Proc # proc( info_x ), proc.process( info_x ){ switch info_x }
```

### Memento
```coffeescript
Info # info( data )
Proc # proc( data ), proc.save(){ return info( data ) }, proc.restore( info ){ proc.data = info.data }
```

### Null Object
```coffeescript

```

### Observer
```coffeescript
Info # info.process()
Proc # proc.add( _infos.push info ), proc.process( _infos.each _info.process() )
```

### State
```coffeescript

```

### Strategy
```coffeescript
Info_x extends INFO
Proc # proc( info_x ), proc.process( info_x.process() )
```

### Template method
```coffeescript

```

### Visitor
```coffeescript

```

### NOTE:
`upper case word: abstract class`
`camel case word: concrete/normal class`
`lower case word: class instance`

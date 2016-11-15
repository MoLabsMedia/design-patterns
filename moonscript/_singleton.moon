class Singleton
  @instance: null
  @getInstance: () => 
    return @instance ||= @ arguments\\\

class Main
  @run: () =>
    class Thing extends Singleton
      props: {}
      new: () =>
      setProp: ( key, val ) => 
        @props[ key ] = val
        return
      getProp: ( key ) => 
        return @props[ key ]

    something = Thing\getInstance()
    something\setProp( 'key', 'value' )
    print something\getProp( 'key' )

Main.run()

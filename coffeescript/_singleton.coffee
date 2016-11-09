class Singleton
  @instance: null
  @getInstance: -> 
    return @instance ||= new @ arguments...

class Main
  @run: ->
    class Thing extends Singleton
      props: {}
      constructor: ->
      setProp: ( key, val ) -> 
        @props[ key ] = val
        return
      getProp: ( key ) -> 
        return @props[ key ]

    something = Thing.getInstance()
    something.setProp( 'key', 'value' )
    console.log something.getProp( 'key' )

Main.run()

class Singleton
  @_instance: null
  @getInstance: -> @_instance ||= new @ arguments...

class Example
  run: ->
    class ExampleClass extends Singleton
      constructor: ->
      properties: {}
      set: ( key, val ) -> @properties[ key ] = val; return
      get: ( key ) -> @properties[ key ]

    example = ExampleClass.getInstance()
    example.set 'Singleton', 'This is a singleton value'
    console.log example.get( 'Singleton' )

Example.run()

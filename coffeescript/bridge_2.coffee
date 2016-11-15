# --------------
# CREDIT: http://coffeescript-cookbook.github.io/chapters/design_patterns/bridge
# --------------

class TextSaver
  constructor: ( @filename, @options ) ->
  save: ( data ) ->

class CloudSaver extends TextSaver
  constructor: ( @filename, @options ) ->
    super( @filename, @options )
    return
  save: ( data ) ->
    # Assuming jQuery:
    $( () =>
      $.post( "#{ @options.url }/#{ @filename }", data, () =>
        alert "Saved '#{ data }' to #{ @filename } at #{ @options.url }."
        return
      )
    )

class FileSaver extends TextSaver
  constructor: ( @filename, @options ) ->
    super( @filename, @options )
    @fs = require( 'fs' )
    return
  save: ( data ) ->
    @fs.writeFile( @filename, data, ( err ) =>
      if err? 
        console.log err
      else 
        console.log "Saved '#{ data }' to #{ @filename } in #{ @options.directory }."
    )
    return

filename = "something.txt"
data = "some data"

saver = if window?
  new CloudSaver( filename, { url: 'http://localhost' } )
else if root?
  new FileSaver( filename, { directory: './' } )

saver.save( data )

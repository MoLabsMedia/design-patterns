class TextSaver
  new: ( @filename, @options ) =>
  save: ( data ) =>

class CloudSaver extends TextSaver
  new: ( @filename, @options ) =>
    super( @filename, @options )
    return
  save: ( data ) =>
    -- Assuming jQuery:
    $( () =>
      $\post( "#{ @options\url }/#{ @filename }", data, () =>
        alert "Saved '#{ data }' to #{ @filename } at #{ @options\url }\"
        return
      )
    )

class FileSaver extends TextSaver
  new: ( @filename, @options ) =>
    super( @filename, @options )
    @fs = require( 'fs' )
    return
  save: ( data ) =>
    @fs\writeFile( @filename, data, ( err ) =>
      if err? 
        print err
      else 
        print "Saved '#{ data }' to #{ @filename } in #{ @options\directory }\"
    )
    return

filename = "something\txt"
data = "some data"

saver = if window?
  CloudSaver( filename, { url: 'http://localhost' } )
else if root?
  FileSaver( filename, { directory: '\/' } )

saver\save( data )

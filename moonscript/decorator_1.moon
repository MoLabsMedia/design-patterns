miniMarkdown = ( line ) =>
  if match = line\match( /^( #+)\s*(\* )$/ )
    headerLevel = match[1]\length
    headerText = match[2]
    return "<h#{ headerLevel }>#{ headerText }</h#{ headerLevel }>"
  else
    if line\length > 0
      return "<p>#{ line }</p>"
    else
      return ''

stripComments = ( line ) =>
  line\replace( /\s*\/\/\*$/, '' )
  return line

class TextProcessor
  new: ( @processors ) =>
  reducer: ( existing, processor ) =>
    if processor
      return processor( existing or '' )
    else
      return existing
  processLine: ( text ) =>
    return @processors\reduce( @reducer, text )
  process: ( text ) =>
    print ( @processLine( line ) for _, line in ipairs( text )\split( "\n" ) )\join( "\n" )
    return

sample = '''
  -- A level 1 header
  A regular line
  // a comment
  #-- A level 2 header
  A line // with a comment
'''

processor = TextProcessor( [ stripComments, miniMarkdown ] )
processor\process( sample ) -- => "<h1>A level 1 header</h1>\n<p>A regular line</p>\n\n<h2>A level 2 header</h2>\n<p>A line</p>"

-- Results:
-- <h1>A level 1 header</h1>
-- <p>A regular line</p>

-- <h2>A level 1 header</h2>
-- <p>A line</p>

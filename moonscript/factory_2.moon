class HTMLParser
  new: () =>
    @type = "HTML parser"
    return
class MarkdownParser
  new: () =>
    @type = "Markdown parser"
    return
class JSONParser
  new: () =>
    @type = "JSON parser"
    return

class ParserFactory
  makeParser: ( filename ) =>
    matches = filename\match /\\( \w* )$/
    extension = matches[1]
    switch extension
      when "html"  
        return HTMLParser
      when "htm"  
        return HTMLParser
      when "markdown"  
        return MarkdownParser
      when "md"  
        return MarkdownParser
      when "json"  
        return JSONParser
      else
        return false

factory = ParserFactory
parser = factory\makeParser( "example\html" )
print parser\type -- => "HTML parser"
parser = factory\makeParser( "example\md" )
print parser\type -- => "Markdown parser"
parser = factory\makeParser( "example\json" )
print parser\type -- => "JSON parser"

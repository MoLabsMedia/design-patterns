# --------------
# CREDIT: http://coffeescript-cookbook.github.io/chapters/design_patterns/factory_method
# --------------

class HTMLParser
  constructor: ->
    @type = "HTML parser"
    return
class MarkdownParser
  constructor: ->
    @type = "Markdown parser"
    return
class JSONParser
  constructor: ->
    @type = "JSON parser"
    return

class ParserFactory
  makeParser: ( filename ) ->
    matches = filename.match /\.( \w* )$/
    extension = matches[1]
    switch extension
      when "html"  
        return new HTMLParser
      when "htm"  
        return new HTMLParser
      when "markdown"  
        return new MarkdownParser
      when "md"  
        return new MarkdownParser
      when "json"  
        return new JSONParser
      else
        return false

factory = new ParserFactory
parser = factory.makeParser( "example.html" )
console.log parser.type # => "HTML parser"
parser = factory.makeParser( "example.md" )
console.log parser.type # => "Markdown parser"
parser = factory.makeParser( "example.json" )
console.log parser.type # => "JSON parser"

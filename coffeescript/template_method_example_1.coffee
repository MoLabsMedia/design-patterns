# --------------
# CREDIT: http://coffeescript-cookbook.github.io/chapters/design_patterns/template_method
# --------------

class Document
  produceDocument: ->
    @produceHeader()
    @produceBody()
    return

  produceHeader: ->
  produceBody: ->

class DocWithHeader extends Document
  produceHeader: ->
    console.log "Producing header for DocWithHeader"
    return

  produceBody: ->
    console.log "Producing body for DocWithHeader"
    return

class DocWithoutHeader extends Document
  produceBody: ->
    console.log "Producing body for DocWithoutHeader"
    return

docs = [ new DocWithHeader, new DocWithoutHeader ]
for doc in docs
  doc.produceDocument() 

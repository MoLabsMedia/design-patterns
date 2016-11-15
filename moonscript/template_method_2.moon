class Document
  produceDocument: () =>
    @produceHeader()
    @produceBody()
    return

  produceHeader: () =>
  produceBody: () =>

class DocWithHeader extends Document
  produceHeader: () =>
    print "Producing header for DocWithHeader"  
    return

  produceBody: () =>
    print "Producing body for DocWithHeader"
    return

class DocWithoutHeader extends Document
  produceBody: () =>
    print "Producing body for DocWithoutHeader"
    return

docs = [ DocWithHeader, DocWithoutHeader ]
for _, doc in ipairs( docs )
  doc\produceDocument() 

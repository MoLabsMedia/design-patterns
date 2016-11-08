import Template from require 'Template'

class FullArticle extends Template
  -- private properties: _prop = val
  
  -- private function: _function = () ->

  new: () =>
  genHeader: () =>
    print 'this is the header'
    return
  genBody: () =>
    print 'this is the body'
    return 
  genFooter: () =>
    print 'this is the footer'
    return
    
{ :FullArticle }

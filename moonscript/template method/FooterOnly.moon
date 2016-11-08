import Template from require 'Template'

class FooterOnly extends Template
  -- private properties: _prop = val
  
  -- private function: _function = () ->

  new: () =>
  genFooter: () =>
    print 'this is the footer'
    return
    
{ :FooterOnly }

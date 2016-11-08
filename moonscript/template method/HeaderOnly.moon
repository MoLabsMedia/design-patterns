import Template from require 'Template'

class HeaderOnly extends Template
  -- private properties: _prop = val
  
  -- private function: _function = () ->

  new: () =>
  genHeader: () =>
    print 'this is the header'
    return
  
{ :HeaderOnly }

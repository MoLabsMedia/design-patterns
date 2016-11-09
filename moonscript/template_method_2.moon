class Template
  -- private properties: _prop = val
  
  -- private function: _function = () ->

  new: () => return
  render: () =>
    @genHeader()
    @genBody()
    @genFooter()
    return
  genHeader: () =>
  genBody: () =>
  genFooter: () =>

{ :Template }
import Template from require 'Template'

class HeaderOnly extends Template
  -- private properties: _prop = val
  
  -- private function: _function = () ->

  new: () =>
  genHeader: () =>
    print 'this is the header'
    return
  
{ :HeaderOnly }
import Template from require 'Template'

class FooterOnly extends Template
  -- private properties: _prop = val
  
  -- private function: _function = () ->

  new: () =>
  genFooter: () =>
    print 'this is the footer'
    return
    
{ :FooterOnly }
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
import FooterOnly from require 'FooterOnly'
import HeaderOnly from require 'HeaderOnly'
import FullArticle from require 'FullArticle'

docs = {
  FooterOnly()
  HeaderOnly()
  FullArticle()
}
for i, doc in ipairs docs
  doc\render()

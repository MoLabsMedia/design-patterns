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

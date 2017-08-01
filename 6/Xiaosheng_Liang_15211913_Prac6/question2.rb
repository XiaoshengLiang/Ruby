require 'nokogiri'
require 'open-uri'
require 'pp'

doc=Nokogiri::HTML(open("http://www.ucd.ie"))

##search for elements "img"
elements=doc.xpath("//img")
p elements[5]
p elements.length
puts "*************"

##search for elements "p"
elements=doc.xpath("//p")
p elements[5]
p elements.length
puts "*************"

#search for the elements "a herf"
elements=doc.xpath("//a[@href]")
p elements[5]
p elements.length
puts "*************"

#search for the elements "div"
elements=doc.xpath("//div")
p elements[5]
p elements.length
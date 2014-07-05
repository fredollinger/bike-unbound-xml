#!/usr/bin/ruby

require "rexml/document"

#file = File.new("cyclingunbound.housing.2014-06-30.xml")
file = File.new("cyclingunbound.wordpress.2014-06-30.xml")
doc = REXML::Document.new file
channel=doc.root.elements[1]
#doc.root.each_element_with_text( 'wp:category_nicename' ) {|e| p e}
#doc.root.elements.each("channel/item/wp:category") {|e| p e}
arr = Array.new
channel.each_element_with_text() {|e| 
    #p e.name
    e.each_element_with_text() {|e| 
	att=e.attribute("nicename")
	if nil != att then
		#p att.class
		#p att.value
	end
	# p e.name
	# p e.namespace

	if  "http://purl.org/rss/1.0/modules/content/" == e.namespace and
 	     "encoded" == e.name	then
		#p e.name
		#p e.namespace
		cdata = e.cdatas
		#p cdata[0]
	end
 	if "title" == e.name then
		p e.text
	end
    } # e.each_element_with_text() {|e| 
} # channel.each_element_with_text() {|e| 

#p arr

#!/usr/bin/ruby

require "rexml/document"

file = File.new("cyclingunbound.housing.2014-06-30.xml")
doc = REXML::Document.new file
channel=doc.root.elements[1]
#doc.root.each_element_with_text( 'wp:category_nicename' ) {|e| p e}
#doc.root.elements.each("channel/item/wp:category") {|e| p e}
channel.each_element_with_text() {|e| 
    #p "hi"
    if "category" == e.name then
	e.each_element_with_text() {|e| 
    		if "category_nicename" == e.name then
			p e.name
			p e.text
		end
     }
    end
}

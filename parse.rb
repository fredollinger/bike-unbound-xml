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
    # p e.name
    e.each_element_with_text() {|e| 
        # p e.name
        if "category" == e.name then
	    p e.name
	    e.each_element_with_text() {|e| 
    		if "category_nicename" == e.name then
			p e.name
			p e.text
			arr.push(e.text)
			arr=arr.uniq
		end
     	    }
    	end
    } # e.each_element_with_text() {|e| 
} # channel.each_element_with_text() {|e| 

p arr

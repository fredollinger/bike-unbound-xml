#!/usr/bin/ruby

require "rexml/document"

file = File.new("cyclingunbound.housing.2014-06-30.xml")
doc = REXML::Document.new file
channel=doc.root.elements[1]

#doc.root.each_element_with_text( 'wp:category_nicename' ) {|e| p e}
channel.each_element() {|e| p e}

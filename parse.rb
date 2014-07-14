#!/usr/bin/ruby

require "rexml/document"

def friendly_filename(filename)
	filename.gsub(/[^\w\s_-]+/, '')
        .gsub(/(^|\b\s)\s+($|\s?\b)/, '\\1\\2')
	.gsub(/\s+/, '_')
end

#file = File.new("cyclingunbound.housing.2014-06-30.xml")
file = File.new("cyclingunbound.wordpress.2014-06-30.xml")
doc = REXML::Document.new file
channel=doc.root.elements[1]
arr = Array.new
dir="cyclingunbound/uncategorized"
`mkdir -p #{dir}`
cdata=""
title=""
channel.each_element_with_text() {|e| 
    e.each_element_with_text() {|e| 
	att=e.attribute("nicename")
	if nil != att then
		dir="cyclingunbound/#{att}"
		`mkdir -p #{dir}`
	end

	if  "http://purl.org/rss/1.0/modules/content/" == e.namespace and
 	     "encoded" == e.name	then
		cdata = e.cdatas[0]
	end
 	if "title" == e.name then
		title="#{dir}/"+friendly_filename(e.text)+".txt"
	end
	if "" != title and "" != cdata then
		somefile = File.open(title, "w")
		somefile.puts cdata 
		somefile.close
		title=""
		cdata=""

	end
    } # e.each_element_with_text() {|e| 
} # channel.each_element_with_text() {|e| 


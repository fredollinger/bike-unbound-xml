BOOK=cyclingunbound

$(BOOK).pdf:
	dblatex $(BOOK).xml

clean:
	rm -f $(BOOK).pdf
edit:
	vim $(BOOK).xml
view: $(BOOK).pdf
	evince $(BOOK).pdf

pdf: $(BOOK).pdf
	echo "making pdf"

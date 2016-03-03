# commands
PDFTEX=xelatex -halt-on-error
BIBTEX=bibtex

# files
TARGET=target_word_prediction

$(TARGET).pdf: $(TARGET).tex $(TARGET).bib $(FIGURES)
	$(PDFTEX) $(TARGET)

bib: $(TARGET).bib
	$(BIBTEX) $(TARGET)
	$(PDFTEX) -interaction=batchmode -no-pdf $(TARGET)
	$(PDFTEX) -interaction=batchmode $(TARGET)
	$(PDFTEX) $(TARGET)

clean:
	latexmk -C
	$(RM) $(TARGET).bbl $(TARGET).xdv $(TARGET).ttt $(TARGET).fff

.PHONY: $(TARGET).pdf bib clean

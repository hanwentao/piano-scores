TEX_FILE = scores.tex
PDF_FILE = $(TEX_FILE:.tex=.pdf)
JPEG_FILE = $(TEX_FILE:.tex=.jpg)
SCORE_ABC_FILES = $(wildcard *.abc)
SCORE_PDF_FILES = $(SCORE_ABC_FILES:.abc=.pdf)
SCORE_MIDI_FILES = $(ABC_FILES:.abc=.mid)

.PHONY: all pdf jpeg midi clean

all: pdf

pdf: $(TEX_FILE) $(SCORE_PDF_FILES)
	latexmk -xelatex $<

jpeg: pdf
	convert -density 1200 $(PDF_FILE) -alpha remove -quality 100 -resample 300 $(JPEG_FILE)

midi: $(SCORE_MIDI_FILES)

%.pdf: %.abc
	./abc2pdf $<

%.mid: %.abc
	abc2midi $< -o $@

clean:
	latexmk -C
	$(RM) *.mid *.pdf

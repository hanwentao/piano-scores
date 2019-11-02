TEX_FILE = scores.tex
PDF_FILE = $(TEX_FILE:.tex=.pdf)
JPEG_FILE = $(TEX_FILE:.tex=.jpg)
ABC_FILES = $(wildcard *.abc)
MIDI_FILES = $(ABC_FILES:.abc=.mid)

.PHONY: all pdf jpeg midi clean

all: pdf

pdf: $(TEX_FILE) $(ABC_FILES)
	latexmk -xelatex -shell-escape $<

jpeg: pdf
	convert -density 1200 $(PDF_FILE) -alpha remove -quality 100 -resample 300 $(JPEG_FILE)

midi: $(MIDI_FILES)

%.mid: %.abc
	abc2midi $< -o $@

clean:
	latexmk -C $(TEX_FILE)
	$(RM) *.{,e}ps
	$(RM) *.mid

TEX_FILE = scores.tex
ABC_FILES = $(wildcard *.abc)
MIDI_FILES = $(ABC_FILES:.abc=.mid)

.PHONY: all pdf midi clean

all: pdf

pdf: $(TEX_FILE) $(ABC_FILES)
	latexmk -xelatex -shell-escape $<

midi: $(MIDI_FILES)

%.mid: %.abc
	abc2midi $< -o $@

clean:
	latexmk -C $(TEX_FILE)
	$(RM) *.{,e}ps
	$(RM) *.mid

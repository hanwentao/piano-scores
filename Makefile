TEX_FILE = scores.tex
PDF_FILE = $(TEX_FILE:.tex=.pdf)
JPEG_FILE = $(TEX_FILE:.tex=.jpg)
SCORE_ABC_FILES = $(wildcard *.abc)
SCORE_PDF_FILES = $(SCORE_ABC_FILES:.abc=.pdf)
SCORE_MIDI_FILES = $(SCORE_ABC_FILES:.abc=.mid)
SCORE_WAVE_FILES = $(SCORE_ABC_FILES:.abc=.wav)
SCORE_AAC_FILES = $(SCORE_ABC_FILES:.abc=.aac)

.PHONY: all pdf jpeg midi clean

all: pdf

pdf: $(TEX_FILE) $(SCORE_PDF_FILES)
	latexmk -xelatex $<

jpeg: pdf
	convert -density 1200 $(PDF_FILE) -alpha remove -quality 100 -resample 300 $(JPEG_FILE)

midi: $(SCORE_MIDI_FILES)

wave: $(SCORE_WAVE_FILES)

aac: $(SCORE_AAC_FILES)

%.pdf: %.abc
	./abc2pdf $<

%.mid: %.abc
	abc2midi $< -o $@

%.wav: %.mid
	timidity $< -Ow

%.aac: %.wav
	ffmpeg -i $< -acodec aac $@

clean:
	latexmk -C
	$(RM) *.mid *.wav *.aac *.pdf *.jpg

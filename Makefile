SHELL=/bin/bash

all:

COPIED=style.css ingolia.jpg banner.png ingolia-cv.pdf mcglincy1.jpg mcglincy-cv.pdf iwasaki.jpg lab_20161123_small.jpg zuriah_20161014.jpg celeste.jpg Celeste_Riepe_CV.pdf KS.jpg FL.jpg anna.jpg POL.jpg NY.jpg eric.jpg mia.jpg samFernandez.jpg ryan.jpg

$(addprefix WWW/,$(COPIED)): WWW/%: src/%
	mkdir -p $(dir $@)
	cp $< $@

all: $(addprefix WWW/,$(COPIED))

SOFTWARE_TEMPLATED=# seqloc-tutorial.html seqloc-datafiles-tutorial.html samtools-tutorial.html

$(addprefix src/, $(SOFTWARE_TEMPLATED)): %.html: %_software.html src/software-preamble.html src/software-postscript.html
	cat src/software-preamble.html $< src/software-postscript.html > $@

TEMPLATED=index.html research.html people.html publications.html software.html $(SOFTWARE_TEMPLATED)

$(addprefix WWW/,$(TEMPLATED)): WWW/%.html: src/%.html src/preamble.html src/postscript.html
	mkdir -p $(dir $@)
	cat src/preamble.html $< src/postscript.html > $@

all: $(addprefix WWW/,$(TEMPLATED))

src/seqloc-tutorial_software.html: /Volumes/sequence/ingolia/Prog/SeqLoc/seqloc/doc/location-tutorial.md
	./Markdown.pl $< > $@

src/seqloc-datafiles-tutorial_software.html: /Volumes/sequence/ingolia/Prog/SeqLoc/seqloc-datafiles/doc/datafile-tutorial.md
	./Markdown.pl $< > $@

src/samtools-tutorial_software.html: /Volumes/sequence/ingolia/Prog/SamTools/samtools/doc/samtools-tutorial.txt
	./Markdown.pl $< > $@

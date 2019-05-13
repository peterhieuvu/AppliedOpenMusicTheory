OUTDIR = build

SRC = $(wildcard chapters/*.lytex)

default: $(SRC)
	$(foreach var,$(patsubst chapters/%.lytex,%,$(SRC)), make soapt SUBFILE=$(var) SUBDIR=chapters;)
	make boat

boat:	OpenAppliedMusicTheory.lytex
	lilypond-book --output=$(OUTDIR) --pdf OpenAppliedMusicTheory.lytex
	cd $(OUTDIR) && \
	latexmk -pdf OpenAppliedMusicTheory.tex

boatt:	OpenAppliedMusicTheory.tex
	latexmk -pdf -output-directory=$(OUTDIR) OpenAppliedMusicTheory.tex
	
soapt:	$(SUBDIR)/$(SUBFILE).lytex
	lilypond-book --output=$(OUTDIR)/$(SUBDIR) --pdf $(SUBDIR)/$(SUBFILE).lytex
	cd $(OUTDIR)/$(SUBDIR) && \
	sed -i 's/\\usepackage{graphics}//g' $(SUBFILE).tex && \
	latexmk -pdf $(SUBFILE).tex

soaptt:	$(SUBDIR)/$(SUBFILE).tex
	latexmk -pdf -output-directory=$(OUTDIR)/$(SUBDIR) $(SUBDIR)/$(SUBFILE).tex

clean:
	rm -r $(OUTDIR)

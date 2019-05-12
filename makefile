OUTDIR = build

boat:	OpenAppliedMusicTheory.lytex
	lilypond-book --output=$(OUTDIR) --pdf OpenAppliedMusicTheory.lytex
	cd $(OUTDIR) && \
	latexmk -pdf OpenAppliedMusicTheory.tex

boatt:	OpenAppliedMusicTheory.tex
	latexmk -pdf -output-directory=$(OUTDIR) OpenAppliedMusicTheory.tex
	
soapt:	$(SUBDIR)/$(SUBFILE).lytex
	lilypond-book --output=$(OUTDIR)/$(SUBDIR) --pdf $(SUBDIR)/$(SUBFILE).lytex
	cd $(OUTDIR)/$(SUBDIR) && \
	latexmk -pdf $(SUBFILE).tex

soaptt:	$(SUBDIR)/$(SUBFILE).tex
	latexmk -pdf -output-directory=$(OUTDIR)/$(SUBDIR) $(SUBDIR)/$(SUBFILE).tex

clean:
	rm -r $(OUTDIR)

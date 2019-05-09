OUTDIR = build

boat:	OpenAppliedMusicTheory.lytex
	lilypond-book --output=$(OUTDIR) --pdf OpenAppliedMusicTheory.lytex
	cd $(OUTDIR) && \
	pdflatex OpenAppliedMusicTheory.tex

boatt:	OpenAppliedMusicTheory.tex
	pdflatex -output-directory=$(OUTDIR) OpenAppliedMusicTheory.tex
	
soapt:	$(SUBDIR)/$(SUBFILE).lytex
	lilypond-book --output=$(OUTDIR)/$(SUBDIR) --pdf $(SUBDIR)/$(SUBFILE).lytex
	cd $(OUTDIR)/$(SUBDIR) && \
	pdflatex $(SUBFILE).tex

soaptt:	$(SUBDIR)/$(SUBFILE).tex
	pdflatex -output-directory=$(OUTDIR)/$(SUBDIR) $(SUBDIR)/$(SUBFILE).tex

clean:
	rm -r $(OUTDIR)

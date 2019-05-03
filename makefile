OUTDIR = build

boat:	OpenAppliedMusicTheory.lytex
	lilypond-book --output=$(OUTDIR) --pdf OpenAppliedMusicTheory.lytex
	cd $(OUTDIR) && \
	pdflatex OpenAppliedMusicTheory.tex

boatt:	OpenAppliedMusicTheory.tex
	pdflatex -output-directory=$(OUTDIR) OpenAppliedMusicTheory.tex
	
soapt:	$(SUBDIR)/$(SUBFILE)
	lilypond-book --output=$(SUBDIR)/$(OUTDIR) --pdf $(SUBFILE).lytex
	cd $(SUBDIR)/$(OUTDIR) && \
	pdflatex $(SUBFILE).tex

soaptt:	$(SUBDIR)/$(SUBFILE)
	pdflatex -output-directory=$(SUBDIR)/$(OUTDIR) $(SUBDIR)/$(SUBFILE).tex

clean:
	rm -r $(OUTDIR)

all: 
	latexmk -pv

update:
	#continuously-update
	latexmk -pvc

clean:
	latexmk -c
	rm -f *.bbl *.dvi *.synctex.gz *-blx.bib *.run.xml *.fls .DS_Store

distclean:
	latexmk -C
	rm -f *.bbl

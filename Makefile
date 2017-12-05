source=essay.md
bibliography=essay.bib
citestyle=~/.pandoc/harvard.csl
output=essay.pdf
margin=1in

all:
	pandoc --bibliography $(bibliography) --filter pandoc-citeproc \
	--csl $(citestyle) --variable=geometry:margin=$(margin) \
	$(source) -o $(output)
	cat $(source) | grep -v  "^%" | wc -w | \
		tr -d "\n" | tr -d " "  && echo " Words"

clean:
	rm essay.pdf

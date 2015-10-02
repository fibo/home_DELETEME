
.PHONY: init.sh

init.sh:
	grep '    ' README.md | sed -e 's/    //' > init.sh


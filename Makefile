VERSION=0.1
PACKAGE=emacs-for-python-${VERSION}

batch-compile:
	find . -name \*.el | xargs emacs -Q -l epy-init.el -batch -f batch-byte-compile

clean:
	find . -name \*.elc | xargs rm -f
	rm -rf ${PACKAGE}
	rm -f ${PACKAGE}.zip ${PACKAGE}.tar.bz2 ${PACKAGE}.tar.gz

package: clean
	mkdir ${PACKAGE}
	cp -r COPYING Makefile README.org wiki auto-complete completion epy-init.el flymake plugins rope-dist yasnippet ${PACKAGE}

tar.gz: package
	tar czf ${PACKAGE}.tar.gz ${PACKAGE}

tar.bz2: package
	tar cjf ${PACKAGE}.tar.bz2 ${PACKAGE}

zip: package
	zip -r ${PACKAGE}.zip ${PACKAGE}

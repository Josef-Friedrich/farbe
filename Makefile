jobname = farbe
texmf = $(HOME)/texmf
texmftex = $(texmf)/tex/luatex
installdir = $(texmftex)/$(jobname)

all: install

install:
	cp -f $(jobname).tex $(installdir)
	cp -f $(jobname).sty $(installdir)
	cp -f $(jobname).lua $(installdir)

test: install test_lua

test_lua:
	busted --lua=/usr/bin/lua5.3 --exclude-tags=skip tests/lua/test-*.lua

.PHONY: all install

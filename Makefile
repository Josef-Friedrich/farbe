jobname = farbe
texmf = $(HOME)/texmf
texmftex = $(texmf)/tex/luatex
installdir = $(texmftex)/$(jobname)

all: install

install:
	cp -f $(jobname).tex $(installdir)
	cp -f $(jobname).lua $(installdir)

.PHONY: all install

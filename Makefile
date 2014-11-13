# translate Makefile

DESTDIR=
PREFIX=/usr/local
BINDIR=$(PREFIX)/bin
MANDIR=$(PREFIX)/share/man/man1
DOCDIR=$(PREFIX)/share/doc/translate

.PHONY: install uninstall

install:
	install -m755 -d $(DESTDIR)$(BINDIR)
	install -m755 -d $(DESTDIR)$(MANDIR)
	install -m755 -d $(DESTDIR)$(DOCDIR)
	gzip -c translate.1 > translate.1.gz
	install -m755 -t $(DESTDIR)$(BINDIR) translate
	install -m644 -t $(DESTDIR)$(MANDIR) translate.1.gz
	install -m644 -t $(DESTDIR)$(DOCDIR) README
	rm -f translate.1.gz

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/translate
	rm -f $(DESTDIR)$(MANDIR)/translate.1.gz
	rm -rf $(DESTDIR)$(DOCDIR)

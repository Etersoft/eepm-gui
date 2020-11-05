
pkgdatadir=$(datadir)/eepm
# due using %makeinstallstd in spec
instpkgdatadir=$(pkgdatadir)

install:
	mkdir -p $(DESTDIR)$(bindir)/
	cp -a `ls -1 bin/* | grep -v "[-_]"` $(DESTDIR)$(bindir)/
	chmod 0755 $(DESTDIR)$(bindir)/*
	sed -e "s|SHAREDIR=.*|SHAREDIR=$(instpkgdatadir)|g" \
		-e "s|CONFIGDIR=.*|CONFIGDIR=$(sysconfdir)/eepm|g" \
		-e "s|@VERSION@|$(version)|g" <bin/epm-gui >$(DESTDIR)$(bindir)/epm-gui
	cp -a data/eepm-gui.desktop $(DESTDIR)/$(datadir)/applications/
	cp -a data/eepm-gui.png $(DESTDIR)/$(datadir)/pixmaps/

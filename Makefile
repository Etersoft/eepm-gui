
pkgdatadir=$(datadir)/eepm
# due using %makeinstallstd in spec
instpkgdatadir=$(pkgdatadir)

install:
	mkdir -p $(DESTDIR)$(bindir)/
	#cp -a `ls -1 bin/* | grep -v "[-_]"` $(DESTDIR)$(bindir)/
	cp -a bin/* $(DESTDIR)$(bindir)/
	chmod 0755 $(DESTDIR)$(bindir)/*
	sed -e "s|SHAREDIR=.*|SHAREDIR=$(instpkgdatadir)|g" \
		-e "s|CONFIGDIR=.*|CONFIGDIR=$(sysconfdir)/eepm|g" \
		-e "s|@VERSION@|$(version)|g" <bin/epm-gui >$(DESTDIR)$(bindir)/epm-gui
	install -m0644 -D data/epm-gui.desktop $(DESTDIR)/$(datadir)/applications/epm-gui.desktop
	install -m0644 -D data/epm-gui.png $(DESTDIR)/$(datadir)/pixmaps/epm-gui.png

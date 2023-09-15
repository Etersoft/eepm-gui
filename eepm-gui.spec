Name: eepm-gui
Version: 0.1
Release: alt1

Summary: Etersoft EPM package manager GUI

License: AGPL-3.0+
Group: System/Configuration/Packaging
Url: http://wiki.etersoft.ru/EPM

Packager: Vitaly Lipatov <lav@altlinux.ru>

# Source-git: https://github.com/Etersoft/eepm-gui.git
Source: ftp://updates.etersoft.ru/pub/Etersoft/Sisyphus/sources/tarball/%name-%version.tar

BuildArchitectures: noarch

Requires: eepm
Requires: zenity
Requires: shared-mime-info

Provides: epm-gui = %name-%version

%description
Etersoft EPM package manager GUI is a user unterface to the main eepm functions,
like install/remove packages and set thirdside applications from a application list.

%prep
%setup

%install
%make_install install DESTDIR=%buildroot datadir=%_datadir bindir=%_bindir mandir=%_mandir sysconfdir=%_sysconfdir version=%version-%release

%files
%doc README.md LICENSE
%_bindir/epm-gui
%_desktopdir/epm-gui.desktop
%_pixmapsdir/epm-gui.png

%changelog
* Thu Nov 05 2020 Vitaly Lipatov <lav@altlinux.ru> 0.1-alt1
- initial build for ALT Sisyphus

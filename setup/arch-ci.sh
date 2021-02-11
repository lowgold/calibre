#!/bin/sh
#
# arch-ci.sh
# Copyright (C) 2020 Kovid Goyal <kovid at kovidgoyal.net>

set -xe
if [ "$1" = "translations" ]; then
	sudo apt-get -y update
	# sudo apt-get -y upgrade
	sudo apt-get -y install fonts-liberation python3 imagemagick libjpeg-turbo-progs libjxr-tools optipng poppler-utils python3-apsw python3-bs4 python3-chardet python3-chm python3-css-parser python3-cssselect python3-dateutil python3-dbus python3-feedparser python3-html2text python3-html5-parser python3-lxml python3-markdown transifex-client python3-mechanize python3-msgpack python3-netifaces python3-pil python3-pygments python3-pyqt5 python3-pyqt5.qtsvg python3-pyqt5.qtwebengine python3-regex python3-zeroconf xdg-utils python3-dnspython python3-unrardll python3-sphinx libchm-dev libegl1-mesa-dev libhunspell-dev libhyphen-dev libicu-dev libmtp-dev libpodofo-dev libqt5svg5-dev libsqlite3-dev libudev-dev libusb-1.0-0-dev python3-dev python3-psutil qt5-qmake qtbase5-dev qtbase5-private-dev 
	# pyqt is installed from pypi because the version on ubuntu 20.04 is too old
	sudo python3 -m pip install sip pyqt-builder pyqt5-sip pyqt5 pyqtwebengine
else
	useradd -m ci
	pacman -S --noconfirm --needed base-devel sudo git sip pyqt-builder chmlib icu jxrlib hunspell libmtp libusb libwmf optipng podofo python-apsw python-beautifulsoup4 python-cssselect python-css-parser python-dateutil python-dbus python-dnspython python-feedparser python-html2text python-html5-parser python-lxml python-markdown python-mechanize python-msgpack python-netifaces python-unrardll python-pillow python-psutil python-pygments python-pyqt5 python-regex python-zeroconf python-pyqtwebengine qt5-x11extras qt5-svg qt5-imageformats udisks2 hyphen python-pychm python-pycryptodome speech-dispatcher python-sphinx python-urllib3 python-py7zr python-pip 
	chown -R ci:users $GITHUB_WORKSPACE
fi

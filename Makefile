#
# SPDX-License-Identifier: GPL-3.0-or-later

PREFIX ?= /usr/local
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/android-camera
DATA_DIR=$(DESTDIR)$(PREFIX)/share/android-camera
BIN_DIR=$(DESTDIR)$(PREFIX)/bin

DOC_FILES=$(wildcard *.rst)
SCRIPT_FILES=$(wildcard android-camera/*)

all:

check: shellcheck

shellcheck:
	shellcheck -s bash $(SCRIPT_FILES)

install: install-android-camera install-doc

install-doc:

	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

install-android-camera:

	install -vdm 755 "$(BIN_DIR)"
	install -vDm 755 android-camera/android-camera "$(BIN_DIR)"

.PHONY: check install install-doc install-android-camera shellcheck

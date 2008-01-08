# $Id: Makefile,v 1.6 2008/01/08 18:07:12 mascarenhas Exp $

include config

all: fastcgi

cgi:

config:
	touch config

fastcgi: src/fastcgi/lfcgi.so

fcgi: fastcgi

src/fastcgi/lfcgi.so: src/fastcgi/lfcgi.o src/fastcgi/lfcgi.h
	$(CC) $(CFLAGS) $(LIB_OPTION) -o src/fastcgi/lfcgi.so src/fastcgi/lfcgi.o -lfcgi 

install:
	mkdir -p $(LUA_DIR)/wsapi
	cp src/wsapi/*.lua $(LUA_DIR)/wsapi

install-fcgi:
	cp src/fastcgi/lfcgi.so $(LUA_LIBDIR)/

install-rocks: install
	mkdir -p $(PREFIX)/samples
	cp -r samples/* $(PREFIX)/samples
	mkdir -p $(PREFIX)/doc
	cp -r doc/* $(PREFIX)/doc

clean:
	rm src/fastcgi/lfcgi.o src/fastcgi/lfcgi.so

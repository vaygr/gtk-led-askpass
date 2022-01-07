
cflags=-Wall -Werror `pkg-config --cflags gtk+-2.0`
ldflags=`pkg-config --libs gtk+-2.0`
DESTDIR=/
PREFIX=/usr/local

all: gtk-led-askpass gtk-led-askpass.1.gz

gtk-led-askpass: gtk-led-askpass.o
	$(CC) $(cflags) $(CFLAGS) $(ldflags) $(LDFLAGS) $< -o $@

gtk-led-askpass.o: gtk-led-askpass.c
	$(CC) $(cflags) $(CFLAGS) -c $< -o $@

gtk-led-askpass.1.gz: gtk-led-askpass.1
	gzip -c9 $< > $@

install: all
	install -o 0 -g 0 gtk-led-askpass -D \
		$(DESTDIR)/$(PREFIX)/bin/gtk-led-askpass
	install -o 0 -g 0 -m 644 gtk-led-askpass.1.gz -D \
		$(DESTDIR)/$(PREFIX)/share/man/man1/gtk-led-askpass.1.gz

clean:
	rm -f *.o gtk-led-askpass gtk-led-askpass.1.gz


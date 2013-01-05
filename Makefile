all: getty

CFLAGS  += -std=c99 -pipe -Os -fomit-frame-pointer
LDFLAGS += -s

%.o: %.c
	$(CC) $(CFLAGS) -c $^
	strip -x -R .comment -R .note $@

%: %.o
	$(CC) $(LDFLAGS) -o $@ $^

getty: getty.o fmt_ulong.o

install:
	install -d $(DESTDIR)/bin $(DESTDIR)/sbin $(DESTDIR)/doc/man/man8
	install getty $(DESTDIR)/sbin
	install -m 644 getty.8 $(DESTDIR)/doc/man/man8/getty.8

clean:
	rm -f *.o getty

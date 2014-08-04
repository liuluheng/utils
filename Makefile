CC = clang
CFLAGS = -g -O2 -Wall

all: htod dtoh clean

htod: htod.o
	$(CC) -o $@ $^

dtoh: dtoh.o
	$(CC) -o $@ $^

.c.o:
	$(CC) -o $@ $(CFLAGS) -c $<

clean:
	rm -f *.o


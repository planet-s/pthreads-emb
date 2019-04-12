SRC=$(wildcard *.c)
OBJ=$(patsubst %.c,%.o,$(SRC))
LOBJ=$(patsubst %.c,%.lo,$(SRC))

all: libpthread.a

libpthread.a: $(OBJ)
	$(AR) -rcs $@ $(OBJ)

libpthread.so: $(LOBJ)
	$(CC) $(CFLAGS) -nostdlib -shared -o $@ $(LOBJ)

%.o: %.c
	$(CC) $(CFLAGS) -I . -c $< -o $@

%.lo: %.c
	$(CC) $(CFLAGS) -fPIC -I . -c $< -o $@

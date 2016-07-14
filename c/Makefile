#CC=clang
CFLAGS=-O3 #-O4
CFLAGS=-g

default: libfalcon_kit.dylib
falcon.a: kmer_lookup.o
	ar -r falcon.a kmer_lookup.o
DW_align.so: DW_banded.c common.h
	${CC} ${CFLAGS} DW_banded.c -shared -fPIC -o DW_align.so

kmer_lookup.so: kmer_lookup.c common.h
	${CC} ${CFLAGS} kmer_lookup.c -shared -fPIC -o kmer_lookup.so

#falcon: DW_banded.c common.h kmer_lookup.c falcon.c 
#	${CC} ${CFLAGS} DW_banded.c kmer_lookup.c falcon.c -o falcon -fPIC

libfalcon_kit.so: falcon.c common.h DW_banded.c kmer_lookup.c
	${CC} DW_banded.c kmer_lookup.c falcon.c -shared -fPIC -o $@
libfalcon_kit.dylib: falcon.c common.h DW_banded.c kmer_lookup.c
	${CC} ${CFLAGS} DW_banded.c kmer_lookup.c falcon.c -O3 -dynamiclib -fPIC -o $@


#falcon2.so: falcon.c common.h DW_banded_2.c kmer_lookup.c
#	${CC} DW_banded_2.c kmer_lookup.c falcon.c -O3 -shared -fPIC -o falcon2.so 

clean:
	rm  *.so *.o *.dylib

all: DW_align.so kmer_lookup.so falcon.so


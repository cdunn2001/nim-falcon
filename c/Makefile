#CC=clang
default: libfalcon_kit.dylib
falcon.a: kmer_lookup.o
	ar -r falcon.a kmer_lookup.o
DW_align.so: DW_banded.c common.h
	${CC} DW_banded.c -O3 -shared -fPIC -o DW_align.so

kmer_lookup.so: kmer_lookup.c common.h
	${CC} kmer_lookup.c -O3 -shared -fPIC -o kmer_lookup.so

#falcon: DW_banded.c common.h kmer_lookup.c falcon.c 
#	${CC} DW_banded.c kmer_lookup.c falcon.c -O4 -o falcon -fPIC 

libfalcon_kit.so: falcon.c common.h DW_banded.c kmer_lookup.c
	${CC} DW_banded.c kmer_lookup.c falcon.c -O3 -shared -fPIC -o $@
libfalcon_kit.dylib: falcon.c common.h DW_banded.c kmer_lookup.c
	${CC} DW_banded.c kmer_lookup.c falcon.c -O3 -dynamiclib -fPIC -o $@


#falcon2.so: falcon.c common.h DW_banded_2.c kmer_lookup.c
#	${CC} DW_banded_2.c kmer_lookup.c falcon.c -O3 -shared -fPIC -o falcon2.so 

clean:
	rm  *.so *.o *.dylib

all: DW_align.so kmer_lookup.so falcon.so


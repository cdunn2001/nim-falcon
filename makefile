#NIM:=nim -d:release
#NIM:=nim -d:release --threads:on --parallelBuild:1
#NIM:=nim -d:release --parallelBuild:1
NIM:=nim --listCmd
DYLD_LIBRARY_PATH=./c
export DYLD_LIBRARY_PATH

default: consensus.exe graph_to_contig.exe graph_to_utgs.exe
	./graph_to_utgs.exe
test: test_graph_to_utgs.exe
	./test_graph_to_utgs.exe
test_graph_to_utgs.exe: graph_to_utgs.nim
graph_to_utgs.exe: graph_to_utgs.nim falcon_kit.nim
%.exe: %.nim
	${NIM} c -o:$@ $<
foo:
	${CC} -o $@ -lfalcon_kit -L./c foo.c
c:
	#c2nim --header --cdecl c/common.h --out:falcon_kit.nim
	#c2nim --prefix:hyperclient_ --dynlib:libname --cdecl hyperclient.h --out:hyperclient.nim
	#c2nim --dynlib:falcon_kit --dynlibOverride:"falcon_kit.so" --cdecl c/common.h --out:falcon_kit.nim
	c2nim --dynlib --cdecl c/common.h --out:falcon_kit.nim
	#c2nim --cdecl c/common.h --out:falcon_kit.nim
clean:
	rm -f *.exe
.PHONY: c

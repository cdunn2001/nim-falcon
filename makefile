#NIM:=nim -d:release
#NIM:=nim -d:release --threads:on --parallelBuild:1
NIM:=nim -d:release --parallelBuild:1

default: consensus.exe graph_to_contig.exe graph_to_utgs.exe
	./graph_to_utgs.exe
test: test_graph_to_utgs.exe
	./test_graph_to_utgs.exe
%.exe: %.nim
	${NIM} c -o:$@ $<
clean:
	rm -f *.exe

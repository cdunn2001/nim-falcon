#NIM:=nim -d:release
#NIM:=nim -d:release --threads:on --parallelBuild:1
NIM:=nim -d:release --parallelBuild:1

default: consensus graph_to_contig graph_to_utgs
	./graph_to_utgs
%: %.nim
	${NIM} c $<

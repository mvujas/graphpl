keyboard_mode:-
	writeln('Unesi broj cvorova i ivica u grafu u formatu: N. M.'),
	read(N),
	read(M),
	init_graph(N, Graph),
	writeln('Sada unesi ivice u formatu: From. To. Cost.'),
	read_edges(M, Graph, Graph1),
	writeln(Graph1).

file_mode:-
	writeln('Unesi naziv fajla:'),
	read(File),
	((not(exists_file(File)),
	writeln('Uneli ste nepostojeci fajl.')
	);
	(open(File, read, Stream),
	read(Stream, N),
	read(Stream, M),
	init_graph(N, Graph),
	read_edges_from_stream(M, Stream, Graph, Graph1),
	writeln(Graph1),
	close(Stream)
	)).

:- [graph],
	writeln('Izaberi rezim za ucitavanje:'),
	writeln(' 1 ) Tastatura'),
	writeln(' Sve ostalo ) Fajl'),
	read(Mode),
	((Mode =:= 1,
	keyboard_mode
	);file_mode).

keyboard_mode(Graph1):-
	writeln('Unesi broj cvorova i ivica u grafu u formatu: N. M.'),
	read(N),
	read(M),
	init_graph(N, Graph),
	writeln('Sada unesi ivice u formatu: From. To. Cost.'),
	read_edges(M, Graph, Graph1).

file_mode(Graph1):-
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
	close(Stream)
	)).

query_mode(Graph):-
	write(' Sada ti pitas, izaberi jednu od opcija (N.): '),
	nl,
	writeln(' 1 ) Pretraga u sirinu '),
	writeln(' 2 ) Pretraga u dubinu '),
	writeln(' 3 ) Najkraca putanja '),
	writeln(' Sve ostalo ) Prekid rada programa '),
	read(Choice),
	!,
	(Choice =:= 1; Choice =:= 2; Choice =:= 3),
	writeln(' Unesi cvorove na kojima zelis da primenis upit (Start. End.): '),
	read(Start),
	read(End),
	((Choice =:= 1,
	call_bfs(Graph, Start, End));
	(Choice =:= 2,
	call_dfs(Graph, Start, End));
	(Choice =:= 3,
	call_dijkstra(Graph, Start, End, _))),
	query_mode(Graph).
	

:- [graph],
	writeln('Izaberi rezim za ucitavanje:'),
	writeln(' 1 ) Tastatura'),
	writeln(' Sve ostalo ) Fajl'),
	read(Mode),
	((Mode =:= 1,
	keyboard_mode(Graph)
	);file_mode(Graph)),
	query_mode(Graph).

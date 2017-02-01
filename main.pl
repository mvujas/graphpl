:- [graph],
	writeln('Unesi broj cvorova i ivica u grafu u formatu: N. M.'),
	read(N),
	read(M),
	init_graph(N, Graph),
	writeln('Sada unesi ivice u formatu: From. To. Cost.'),
	read_edges(M, Graph, Graph1),
	write('Unesi startni i krajnji cvor da proveris da li su povezani u fornatu: Start. End.'),
	read(Start),
	read(End),
	call_dfs(Graph, Start, End).
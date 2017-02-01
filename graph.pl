:- [struct],
	writeln('Library graph loaded successfully.').

% Read new edge and add it to graph 
read_edge(OldGraph, NewGraph):-
	read(From),
	read(To),
	read(Cost),
	add_in_graph(From, To, Cost, OldGraph, NewGraph).
add_in_graph(From, To, Cost, OldGraph, NewGraph):-
	length(OldGraph, Length),
	From < Length,
	To < Length,
	insert_edge_graph(From, [ To, Cost ], OldGraph, NewGraph),
	!.
add_in_graph(From, To, _, OldGraph, OldGraph):- 
	length(OldGraph, Length),
	(From >= Length ; To >= Length),
	writeln('You can\'t connect nodes that aren\'t in graph.'),
	!.

% Initialize empty graph
init_graph(0, []):- !.
init_graph(Length, [ [] | Rest ]):- Length > 0,
	!,
	Length1 is Length - 1,
	init_graph(Length1, Rest).

% Insert edge in Node
insert_edge(Edge, OldEdges, [ Edge | OldEdges ]).

% Insert edge at certain position in graph
insert_edge_graph(0, Edge, [ Node | OldGraph ], [ NewNode | OldGraph ]):- 
	!,
	insert_edge(Edge, Node, NewNode).
insert_edge_graph(Position, Edge, [ OldNode | OldRest ], [ OldNode | NewGraph ]):- 
	Position > 0,
	!,
	Position1 is Position - 1,
	insert_edge_graph(Position1, Edge, OldRest, NewGraph).

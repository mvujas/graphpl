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

% Read N edges in graph, if possible
read_edges(0, OldGraph, OldGraph):- !.
read_edges(N, OldGraph, NewGraph):-
	N > 0,
	N1 is N - 1,
	read_edge(OldGraph, NewGraph1),
	read_edges(N1, NewGraph1, NewGraph),
	!.

% Initialize empty graph
init_graph(0, []):- !.
init_graph(Length, [ [] | Rest ]):- 
	Length > 0,
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

% Create list with same element
create_sample(0, _, []):- !.
create_sample(Length, Pattern, [ Pattern | Result ]):- 
	Length > 0,
	Length1 is Length - 1,
	create_sample(Length1, Pattern, Result),
	!.

% Replace element at Nth position in OldList with NewElement
replace(0, NewElement, [ _ | OldList ], [ NewElement | OldList ]):- !.
replace(N, NewElement, [ OldHead | OldRest ], [ OldHead | NewRest ]):-
	N > 0,
	N1 is N - 1,
	replace(N1, NewElement, OldRest, NewRest),
	!.

% Check if Nth element in Graph is visited
is_visited(Nth, List):-
	nth0(Nth, List, Element),
	Element =:= 1.

% Push whole list in stack
push_whole_in_stack([], OldStack, OldStack):- !.
push_whole_in_stack([ Head | Rest ], OldStack, NewStack):-
	push_first(Head, OldStack, NewStack1),
	push_whole_in_stack(Rest, NewStack1, NewStack),
	!.

% Depth First Search
call_dfs(Graph, Start, End):-
	length(Graph, Length),
	create_sample(Length, 0, Visited),
	init(Stack),
	nth0(Start, Graph, StartNode),
	push_whole_in_stack(StartNode, Stack, Stack1),
	replace(Start, 1, Visited, Visited1),
	((dfs(Graph, End, Visited1, Stack1),
	write('Nodes '), 
	write(Start), 
	write(' and '), 
	write(End), 
	write(' are connected.')
	);
	(write('Nodes '), 
	write(Start), 
	write(' and '), 
	write(End), 
	write(' aren\'t connected.')
	)).
dfs(Graph, End, Visited, Stack):-
	not(empty(Stack)),
	pop_first(Stack, [ Node, _ ], Stack1),
	(Node =:= End;
	(is_visited(Node, Visited), 
	dfs(Graph, End, Visited, Stack1)
	);
	(nth0(Node, Graph, NodeNode),
	replace(Node, 1, Visited, Visited1),
	push_whole_in_stack(NodeNode, Stack1, Stack2),
	dfs(Graph, End, Visited1, Stack2)
	)).

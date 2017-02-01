:- writeln('Library struct loaded successfully.').

% Initialize empty data structure
init([]).

% Push element at the top of structure
push_first(Element, Struct, [ Element | Struct ]).

% Push element at the bottom of structure
push_last(Element, Struct, Result):-
	append(Struct, [Element], Result).

% Return first element of structure and rest of it
pop_first([ Element | Struct ], Element, Struct).  

% Return last element of structure and rest of it
pop_last([ Element ], Element, []):- !.
pop_last([ Head | Struct ], Element, [ Head | Struct1 ]):- 
	pop_last(Struct, Element, Struct1).

% Push element in ascending order
push_asc(Element, [], [Element]):- !.
push_asc([ Edge, Cost ], [ [ Edge1, Cost1 ] | Rest ], [ [ Edge, Cost ], [ Edge1, Cost1 ] | Rest ]):- 
	Cost =< Cost1,
	!.
push_asc([ Edge, Cost ], [ [ Edge1, Cost1 ] | Rest ], [ [ Edge1, Cost1 ] | Result ]):- 
	Cost > Cost1,
	push_asc([ Edge, Cost ], Rest, Result),
	!.

% Push element in descending order
push_desc(Element, [], [Element]):- !.
push_desc([ Edge, Cost ], [ [ Edge1, Cost1 ] | Rest ], [ [ Edge, Cost], [ Edge1, Cost1] | Rest ]):- 
	Cost >= Cost1,
	!.
push_desc([ Edge, Cost ], [ [ Edge1, Cost1 ] | Rest ], [ [ Edge1 , Cost1 ] | Result ]):- 
	Cost < Cost1,
	push_desc([ Edge, Cost ], Rest, Result),
	!.

% Check if structure is empty
empty([]).

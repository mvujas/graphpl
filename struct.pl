:- write(' sruct.pl included successfully.').

% Initialize empty data structure
init(Struct):- Struct = [].

% Push element on top of structure
push_first(Element, Struct, [ Element | Struct ]).

% Return first element of structure and rest of it
pop_first([ Element | Struct ], Element, Struct).  

% Return last element of structure and rest of it
pop_last([ Element ], Element, []).
pop_last([ Head | Struct ], Element, [ Head | Struct1 ]):- 
	pop_last(Struct, Element, Struct1).

% Check if structure is empty
empty([]).

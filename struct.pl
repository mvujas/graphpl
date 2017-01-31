:- writeln(' sruct.pl included successfully.').

% Initialize empty data structure
init(Struct):- Struct = [].

% Push element at the top of structure
push_first(Element, Struct, [ Element | Struct ]).

% Push element at the bottom of structure
push_last(Element, [], [ Element ]).
push_last(Element, [ Head | Rest ], [ Head | Struct ]):-
	push_last(Element, Rest, Struct).

% Return first element of structure and rest of it
pop_first([ Element | Struct ], Element, Struct).  

% Return last element of structure and rest of it
pop_last([ Element ], Element, []).
pop_last([ Head | Struct ], Element, [ Head | Struct1 ]):- 
	pop_last(Struct, Element, Struct1).

% Push element in ascending order
push_asc(Element, [], [Element]).
push_asc(Element, [ Head | Rest ], [ Element, Head | Rest ]):- Element =< Head.
push_asc(Element, [ Head | Rest ], [ Head | Result ]):- Element > Head,
	push_asc(Element, Rest, Result).

% Push element in descending order
push_desc(Element, [], [Element]).
push_desc(Element, [ Head | Rest ], [ Element, Head | Rest ]):- Element >= Head.
push_desc(Element, [ Head | Rest ], [ Head | Result ]):- Element < Head,
	push_desc(Element, Rest, Result).

% Check if structure is empty
empty([]).

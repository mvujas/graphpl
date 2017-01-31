:- write(' stack.pl included.').

init(Stack):- Stack = []. % Initialize empty stack, kinda unessesary
push(Element, Stack, [ Element | Stack ]). % Pushes Element on top of Stack
pop([ Element | Stack ], Element, Stack).  % Returns Element and rest of the Stack
empty([]). % Returns true if stack is empty

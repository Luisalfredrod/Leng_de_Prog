

% ------------------------------------------------------------------------
% Limited deep search
deep_search(Start, Goal,N) :-
	empty_stack(Empty_been_list),
	stack(Start, Empty_been_list, Been_list),
	path(Start, Goal, Been_list,N).


path(Goal, Goal, Been_list, N) :-
  N > -1,%limit
  reverse_print_stack(Been_list).

path(State, Goal, Been_list, N) :-
  N > -1,%limit
  mov(State, Next),
  % not(unsafe(Next)),
  not(member(Next, Been_list)),
  stack(Next, Been_list, New_been_list),
  NewN is N - 1 ,
  path(Next, Goal, New_been_list, NewN), !.

reverse_print_stack(S) :-
  empty_stack(S).

reverse_print_stack(S) :-
  stack(E, Rest, S),
  reverse_print_stack(Rest),
  write(E), nl.



% -----------------------------------------------------------------------------------------
% Quick sort

div(H,[],[],[]).
div(H,[X|T],[X|L],G):-
    X>=H,
    div(H,T,L,G).

div(H,[X|T],L,[X|G]):-
    X<H,
    div(H,T,L,G).

sort([],A,A).
sort([H|T],A,Sorted):-
	div(H,T,L1,L2),
	sort(L1,A,S),
        sort(L2,[H|S],Sorted).

quick_sort(List,Sorted):-
    sort(List,[],Sorted).

:- use_module(library(clpfd)).

y_dimension(14).
x_dimension(14).

/*

pattern1(List).
  it is true when list include the numbers that represent
  pattern1 in a two dimmension space.

How to describe in terms of integers following pattern

XXX
X X 
X X
X X

in a 14x14 = 196 two dimensional space


pattern1(S).

S=[0,1,2,3,4,14,28,29,30,31]

S=[14,15,16,17,28,42,43,44,45]

*/

y_dimension(YD).

pattern1([N|Tail]):-
  N1 #= N + 1,
  member(N1, Tail),
  N2 #= N + 2,
  member(N2, Tail),
  N3 #= N + 3,
  member(N3, Tail),
  N4 #= N+YD,
  member(N4, Tail),
  N5 #= N+2*YD,
  member(N5, Tail),
  N6 #= N+2*YD+1,
  member(N6, Tail),
  N7 #= N+2*YD+2,
  member(N7, Tail),
  N8 #= N+2*YD+3,
  member(N8, Tail).
  
  
  
  


patterns(Rows) :-
        length(Rows, 14),
        maplist(same_length(Rows), Rows),
        append(Rows, Vs), Vs ins 1..195.

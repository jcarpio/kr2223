
:- use_module(library(clpfd)).

x_dim(12).
y_dim(12).


shape(O, Vs):- 
 y_dim(Y),
 x_dim(X),
 Vs = [O,E2,E3,E4,E5,E6,E7,E8,E9],
 MAX #= X * Y - 1,
 Vs ins 0..MAX, 
 D #= O // Y,
 D #< 9, 
 E2 #= O + 1, 
 E3 #= O + 2,
 E4 #= O + 3,
 E5 #= O + Y,
 E6 #= O + 2 * Y,
 E7 #= O + 2 * Y + 1, 
 E8 #= O + 2 * Y + 2, 
 E9 #= O + 2 * Y + 3.

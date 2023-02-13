/*

This is my first Prolog Program
13/02/2023

Natural number using Mathematical Induction

Induction

1) P(n0)
2) n > 1, P(n-1) -> P(n) 

a -> b  % Classic logic

b :- a. % Prolog

a /\ b -> c % Classic logic  /\ = AND

c :- a, b.

*/

% This is also ignore by Prolog

natural(1).  % fact, it is also a clause
natural(N) :- N > 1, N2 is N - 1, natural(N2). % rule, this is also a clause

% This program have two clauses








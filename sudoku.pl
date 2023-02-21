
:- use_module(library(clpfd)).

/*

[[1, 2, 3],
 [2, 3, 1],
 [3, 1, 2]].

sudu([1,2,3], [2,3,1], [3,1,2]).

*/

soduku(Rows) :- length(Rows,3),
                
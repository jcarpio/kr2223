%-----------------------------------------------------
% bubble_sort(+List, -ListR).
% it is true when ListR unifies with a list containing 
% the same elements of List ordered from lowest to highest.
%-----------------------------------------------------

bubble_sort(List, List):- sorted_list(List).
bubble_sort(List, R):- append(L1, [E1, E2|L2], List),
    E1 > E2, append(L1, [E2, E1|L2], List2), 
	bubble_sort(List2, R).

bubble_sort(List, R):- append(_, [E1, E2|_], List),
    E1 =< E2,  
	bubble_sort(List, R).	


/*

sorted_list(+List)
 it is true if List is ordered from lowest to highest.

*/

sorted_list([]).
sorted_list([_]).
sorted_list([H1, H2|Tail]) :- H1 < H2, sorted_list([H2|Tail]).

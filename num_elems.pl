

/*


Count the number of elements in a list

using Mathematical Induction


num_elems(+List, -Number)
 is true if Number represents the number 
 of elements in List.


*/


num_elems([], 0).

num_elems([Head|Tail], R):- num_elems(Tail, N), R is N + 1.



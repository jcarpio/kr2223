/*

my_append(?List1, ?List2, ?Result)
  it is true if Result unify with a list
  that contains the elements of List1 followed
  by the elements of List2.

my_append([1,2,3], [4,5,6], R)
R=[1,2,3,4,5,6]   

+ : The variable need a value.
- : The variable have to be free.
? : The variable can have or not a value.
    The variable can be free or not. 

	Induction
	
	1) P(n0)
	2) For all n > n0, P(n-1) -> P(n)
	                   P(N) :- N2 is N-1, P(N2). 

When we have two variable as "input", we use 
only one to build the induction. The other variable
do not participate in the induction.
				
[1,2,3] [4,5,6]  -> [1,2,3,4,5,6]
  [2,3] [4,5,6]  ->   [2,3,4,5,6]
				
*/


my_append([], L2, L2).

my_append([Head|Tail], L2, [Head|R]):- 
   my_append(Tail, L2, R). 

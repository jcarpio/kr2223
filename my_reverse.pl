/*


  my_reverse(+List, +ListResult)
  
    it is true if ListResult unify with a list
  with same elements in List but in reverse order.
  
  Examples:
  my_reverse([1,2,3], [3,2,1]).
  my_reverse([1], [1]).
  my_reverse([1,2,3,4,5], [5,4,3,2,1]).
  my_reverse([], []).
  
  
  +: parameter needed to ha a value (instantied).
  -: parameter have to be a free variable
  ?: parameter will be instantied or free.
  
  
  Mathematical Induction
  
  1) P(n0)
  2) \/ n > n0, P(n-1) -> P(n)

                P(N) :- N2 is N-1, P(N2).  
  
      Lists
      [], [_], [_, _], [_, _, _], ...
Size   0,   1 ,    2  ,     3    ,

    We are going to use de Size to build the induction.
  
  natural numbers
  1, 2 , 3, 
  
  
*/


my_reverse([], []).

%    P(n)               P(n-1) 

my_reverse([Head|Tail], R2):-  my_reverse(Tail, R),
                  append(R, [Head], R2).
   



% [1,2,3,4,5]   -> Tail -> [2,3,4,5]
%                          
% [5,4,3,2,1]              [5,4,3,2]


  

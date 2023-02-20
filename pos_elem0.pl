/*
 
 pos_elem0(+Pos, +List, -Elem) 
  it is true when Elem unifies with the element
  that occupies the Pos position within List.
  Starting counting from 0.
  
  Mathematical Induction
  1) P(n0)
  2) For all n > n0, P(n-1) -> P(n)
  
*/


pos_elem0(0, [Head|_], Head).

pos_elem0(Pos, ,  ):- Pos > 0, Pos2 is Pos - 1,
  pos_elem0(Pos2, ,  ).
  
  
  
% 3 [a, b, c, d, e]  -> d
%    0  1  2  3  4

% 2    [b, d, d, e]  -> d
%       0  1  2    

	
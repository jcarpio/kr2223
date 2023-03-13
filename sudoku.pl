
:- use_module(library(clpfd)).

/* Sudoku(+Matrix)
   it is true if Matrix represent a valid sudoku.
   
   1. Matrix is a 9x9 matrix
   2. All values in Matriz are in the range from 1 to 9.
   3. Each rows have different values from 1 to 9.
   4. Each column have different values from 1 to 9.
   5. Each 3x3 block have different values from 1 to 9.
   
    sudoku([
      [1,2,3,4,5,6,7,8,9],
      [4,5,6,7,8,9,1,2,3],
      [7,8,9,1,2,3,4,5,6],
      [2,1,4,3,6,5,8,9,7],
      [3,6,5,8,9,7,2,1,4],
      [8,9,7,2,1,4,3,6,5],
      [5,3,1,6,4,2,9,7,8],
      [6,4,2,9,7,8,5,3,1],
      [9,7,8,5,3,1,6,4,2]
	]).

*/

soduku(Rows) :- length(Rows, 9),
    maplist(same_length(Rows), Rows),
	append(Rows, Rs), Rs ins 1..9,
	maplist(all_dictinct, Rows),
	transpose(Rows, Columns), 
	maplist(all_distinct, Columns).
                

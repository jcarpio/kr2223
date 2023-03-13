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

sudoku(Rows) :- length(Rows, 9),
    maplist(same_length(Rows), Rows),
	append(Rows, Rs), Rs ins 1..9,
	maplist(all_distinct, Rows),
	transpose(Rows, Columns), 
	maplist(all_distinct, Columns),
    Rows=[[E11,E12,E13,E14,E15,E16,E17,E18,E19],
          [E21,E22,E23,E24,E25,E26,E27,E28,E29],
          [E31,E32,E33,E34,E35,E36,E37,E38,E39],
		  [E41,E42,E43,E44,E45,E46,E47,E48,E49],
		  [E51,E52,E53,E54,E55,E56,E57,E58,E59],
		  [E61,E62,E63,E64,E65,E66,E67,E68,E69],
		  [E71,E72,E73,E74,E75,E76,E77,E78,E79],
		  [E81,E82,E83,E84,E85,E86,E87,E88,E89],
		  [E91,E92,E93,E94,E95,E96,E97,E98,E99]
		 ],
		 all_distinct([E11,E12,E13,E14,E15,E21,E22,E23,E24]),
		 all_distinct([E16,E17,E18,E19,E25,E26,E27,E28,E29]),
		 all_distinct([E31,E32,E41,E51,E52,E61,E62,E63,E71]),
		 all_distinct([E42,E43,E53,E54,E64,E72,E73,E74,E75]),
		 all_distinct([E33,E34,E44,E45,E55,E65,E66,E76,E77]),
		 all_distinct([E35,E36,E37,E38,E46,E56,E57,E67,E68]),
		 all_distinct([E39,E47,E48,E49,E58,E59,E69,E78,E79]),		 
		 all_distinct([E81,E82,E83,E84,E85,E91,E92,E93,E94]),
		 all_distinct([E86,E87,E88,E89,E95,E96,E97,E98,E99]).
		 
		 
irregular_sudoku1([
                    [_,_,_,_,1,8,9,_,2],
					[_,_,6,2,_,_,1,_,_],
					[_,_,_,6,_,_,7,_,_],
					[4,6,_,_,_,_,_,8,5],
					[_,_,_,_,3,_,_,_,_],
					[6,7,_,_,_,_,_,1,3],
					[_,_,5,_,_,7,_,_,_],
					[_,_,2,_,_,1,5,_,_],
					[5,_,8,4,7,_,_,_,_]
				  ]).
				  
				  
% irregular_sudoku1(S), sudoku(S), maplist(labeling([ff]), S), write(S).

/*

Solution:

[[7,4,3,5,1,8,9,6,2],
 [9,8,6,2,5,4,1,3,7],
 [2,3,4,6,8,9,7,5,1],
 [4,6,7,1,9,3,2,8,5],
 [8,5,1,9,3,2,6,7,4],
 [6,7,9,8,2,5,4,1,3],
 [1,2,5,3,4,7,8,9,6],
 [3,9,2,7,6,1,5,4,8],
 [5,1,8,4,7,6,3,2,9]
 ]

*/

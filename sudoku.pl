      [2,1,4,3,6,5,8,9,7].
      [3,6,5,8,9,7,2,1,4].
      [8,9,7,2,1,4,3,6,5].
      [5,3,1,6,4,2,9,7,8].
      [6,4,2,9,7,8,5,3,1].
      [9,7,8,5,3,1,6,4,2].

*/

soduku(Rows) :- length(Rows, 9),
                maplist(same_length(Rows), Rows),
				append(Rows, Vars), Vars ins 1..9,
				maplist(all_distinct, Rows),
				transpose(Rows, Columns),
				maplist(all_distinct, Columns).
                

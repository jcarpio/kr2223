
:- use_module(library(clpfd)).

puzzle(Pairs, Water, Zebra, Vars):- 
           Houses=[Colors, Nations, Pets, Drinks, Cigars],
           Colors=[Red,Green,Yellow,Blue,Ivory],
		   Nations=[England,Spain,Ukraine,Norway,Japan],
		   Persons=[england,spain,ukraine,norway,japan],
		   Pets=[Dog,Snails,Horse,Fox,Zebra],
		   Drinks=[Coffee,Milk,OrangeJuice,Tea,Water],
		   Cigars=[OldGold,Kools,Chesterfield,LuckyStrike,Parliaments],
		   maplist(all_distinct, Houses),
		   append(Houses, Vars), Vars ins 1..5,
		   England #= Red,
		   Spain #= Dog,
		   Coffee #= Green,
		   Ukraine #= Tea,
		   Ivory + 1 #= Green,
		   OldGold #= Snails,
		   Kools #= Yellow,
		   Milk #= 3,
		   Norway #= 1,
		   next_to(Chesterfield, Fox),
		   next_to(Kools, Horse),
		   LuckyStrike #= OrangeJuice,
		   Japan #= Parliaments,
		   next_to(Norway, Blue),
		   pairs_keys_values(Pairs, Nations, Persons).	   
		   
next_to(House1, House2):- abs(House1-House2) #= 1.
           

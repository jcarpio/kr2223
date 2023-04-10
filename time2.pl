:- load_files('req2.pl').

:- use_module(library(clpfd)).
:- use_module(library(persistency)).
:- use_module(library(reif)).

/*
:- dynamic(class_subject_teacher_times/4).
:- dynamic(coupling/4).
:- dynamic(teacher_freeday/2).
:- dynamic(slots_per_day/1).
:- dynamic(slots_per_week/1).
:- dynamic(class_freeslot/2).
:- dynamic(room_alloc/4)
*/

:- dynamic class_subject_teacher_times/4.
:- dynamic coupling/4.
:- dynamic teacher_freeday/2.
:- dynamic slots_per_day/1.
:- dynamic slots_couplings/2.
:- dynamic slots_per_week/1.
:- dynamic class_freeslot/2.
:- dynamic room_alloc/4.


:- discontiguous class_subject_teacher_times/4.
:- discontiguous class_freeslot/2.

classes(Classes) :-
       setof(C, S^N^T^class_subject_teacher_times(C,S,T,N), Classes).
		
teachers(Teachers) :-
        setof(T, C^S^N^class_subject_teacher_times(C,S,T,N), Teachers).
		
rooms(Rooms) :-
        findall(Room, room_alloc(Room,_C,_S,_Slot), Rooms0),
        sort(Rooms0, Rooms).
		
requirements(Rs) :-
        Goal = class_subject_teacher_times(Class,Subject,Teacher,Number),
        setof(req(Class,Subject,Teacher,Number), Goal, Rs0),
        maplist(req_with_slots, Rs0, Rs).

req_with_slots(R, R-Slots) :- R = req(_,_,_,N), length(Slots, N).


pairs_slots(Ps, Vs) :-
        pairs_values(Ps, Vs0),
        append(Vs0, Vs).
		
sameroom_var(Reqs, r(Class,Subject,Lesson), Var) :-
        memberchk(req(Class,Subject,_Teacher,_Num)-Slots, Reqs),
        nth0(Lesson, Slots, Var).
		
strictly_ascending(Ls) :- chain(Ls, #<).

constrain_room(Reqs, Room) :-
        findall(r(Class,Subj,Less), room_alloc(Room,Class,Subj,Less), RReqs),
        maplist(sameroom_var(Reqs), RReqs, Roomvars),
        all_different(Roomvars).

slot_quotient(S, Q) :-
        slots_per_day(SPD),
        Q #= S // SPD.

/*		
without_([], _, Es) --> seq(Es).
without_([W|Ws], Pos0, [E|Es]) -->
        { Pos #= Pos0 + 1,
          zcompare(R, W, Pos0) },
        without_at_pos0(R, E, [W|Ws], Ws1),
        without_(Ws1, Pos, Es).
without_at_pos0(=, _, [_|Ws], Ws) --> [].
without_at_pos0(>, E, Ws0, Ws0) --> [E].
*/

% list_without_nths(Es0, Ws, Es) :-
%        phrase(without_(Ws, 0, Es0), Es).

 list_without_nths(Lista, [], Lista).
 
 list_without_nths(Lista, [Cab|Resto], R2):-
   list_without_nths(Lista, Resto, R), elimina_pos(R, Cab, R2).
   
/*   
 elimina_pos(+Lista, +Pos, -R)
   es cierto si R unifica con una lista que contiene los elementos
   de Lista exceptuando el que ocupa la posición Pos. Los
   valores de posiciones empiezan en 0.
*/

 elimina_pos([], _, []).
 
 elimina_pos([_|Resto], 0, Resto).
 
 elimina_pos([Cab|Resto], Pos, [Cab|R]):- Pos > 0, Pos2 #= Pos - 1,
   elimina_pos(Resto, Pos2, R).
		
%:- list_without_nths("abcd", [3], "abc").
%:- list_without_nths("abcd", [1,2], "ad").		
		
		
requirements_variables(Rs, Vars) :-
        requirements(Rs),
        pairs_slots(Rs, Vars),
        slots_per_week(SPW),
        Max #= SPW - 1,
        Vars ins 0..Max,
        maplist(constrain_subject, Rs),
        classes(Classes),
        teachers(Teachers),
        rooms(Rooms),
        maplist(constrain_teacher(Rs), Teachers),
        maplist(constrain_class(Rs), Classes),
        maplist(constrain_room(Rs), Rooms).

constrain_class(Rs, Class) :-
        tfilter(class_req(Class), Rs, Sub),
        pairs_slots(Sub, Vs),
        all_different(Vs),
        findall(S, class_freeslot(Class,S), Frees),
        maplist(all_diff_from(Vs), Frees).

all_diff_from(Vs, F) :- maplist(#\=(F), Vs).

constrain_subject(req(Class,Subj,_Teacher,_Num)-Slots) :-
        strictly_ascending(Slots), % break symmetry
        maplist(slot_quotient, Slots, Qs0),
        findall(F-S, coupling(Class,Subj,F,S), Cs),
        maplist(slots_couplings(Slots), Cs),
        pairs_values(Cs, Seconds0),
        sort(Seconds0, Seconds),
        list_without_nths(Qs0, Seconds, Qs),
        strictly_ascending(Qs).	
		
slots_couplings(Slots, F-S) :-
        nth0(F, Slots, S1),
        nth0(S, Slots, S2),
        S2 #= S1 + 1.		

constrain_teacher(Rs, Teacher) :-
        tfilter(teacher_req(Teacher), Rs, Sub),
        pairs_slots(Sub, Vs),
        all_different(Vs),
        findall(F, teacher_freeday(Teacher, F), Fs),
        maplist(slot_quotient, Vs, Qs),
        maplist(all_diff_from(Qs), Fs).

teacher_req(T0, req(_C,_S,T1,_N)-_, T) :- =(T0,T1,T).
class_req(C0, req(C1,_S,_T,_N)-_, T) :- =(C0, C1, T).		

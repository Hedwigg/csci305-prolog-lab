% First_name Last_name
% CSCI 305 Prolog Lab 2

%Mother/2 (father, child) iff F is a parent of C and F is male.
mother(M,C) :-
  parent(M,C),
  female(M).

%Father/2 (father, child) iff F is a parent of C and F is male.
father(F,C) :-
  parent(F,C),
  male(F).

%Spouse/2 (person1, person2) true if p1 is married to p2 or if p2 is married to p1
spouse(P1,P2) :-
  married(P1,P2);
  married(P2,P1).

%child/2 (child, parent) iff parent is parent of child.
child(C,P) :-
  parent(P,C).

%son/2 (child, parent)
son(C,P) :-
  parent(P,C)
  male(C);

  %idk if son is working. Test

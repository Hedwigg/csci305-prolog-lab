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
  married(P1,P2),
  married(P2,P1).

%child/2 (child, parent) iff parent is parent of child.
child(C,P) :-
  parent(P,C).

%son/2 (child, parent) iff parent is the parent of child and child is a male.
son(C,P) :-
  parent(P,C),
  male(C).

%daughter/2 (child, parents) iff parent is the parent of child and child is a female.
daughter(C,P) :-
  parent(P,C),
  female(C).

%sibling/2 (child1, child2) iff child1 and child2 have same parent. Note: a child cannot be their own sibling.
sibling(C1,C2) :-
  parent(OneParent,C1),
  parent(OneParent,C2),
  not(C1 = C2).


%brother/2 (child1,child2) iff child1 and child2 are siblings AND child1 is a boy. Note: a child cannot be their own brother.
brother(C1,C2) :-
  sibling(C1,C2),
  male(C1),
  not(C1 = C2).

%sister/2 (child1,child2) iff child1 and child2 are siblings AND child2 is a girl. Note: a child cannot be their own sister.
sister(C1,C2) :-
  sibling(C1,C2),
  female(C1),
  not(C1 = C2).

%uncle/2(adult, child) ***BY BLOOD*** iff child's parent is a sibling of adult and adult is a MALE.
uncle(A,C) :-
  parent(P,C),
  sibling(A,P),
  male(A).

%uncle/2(adult, child) ***BY MARRIAGE*** iff adult is married to child's parent's sibling and is MALE.
uncle(A,C) :-
  parent(P,C),
  sibling(S,P),
  married(A,S),
  male(A).

%aunt/2(adult, child) *** BY BLOOD*** iff child's parent is a sibling of adult and adult is FEMALE.
aunt(A,C) :-
  parent(P,C),
  sister(A,P).

%aunt/2(adult,child) *** BY MARRIAGE*** iff adult is married to child's parent's sibling and is FEMALE.
aunt(A,C) :-
  parent(P,C),
  sibling(S,P),
  married(A,S),
  female(A).

%grandparent(GP,C) iff GP is parent to the parent of child.
grandparent(GP,C) :-
  parent(X,C),
  parent(GP,X).

%grandfather(GF,C) iff GF is a grandparent of child and is MALE.
grandfather(GP,C) :-
  male(GP),
  parent(X,C),
  parent(GP,X).

%grandmother(GM,C) iff GM is a grandparent of child and is FEMALE.
grandmother(GP,C) :-
  female(GP),
  parent(X,C),
  parent(GP,X).


%grandchild(GC,GP) iff GC is a child of a child of GP.
grandchild(GC,GP) :-
  child(X,GP),
  child(GC,X).



%ancestor/2(Ancestor, person) ancestor is an ancestor to person if they are their parent, or a parent of the persons parent etc (two rules/recursion).
%base case (if the ancestor is the parent of person)
ancestor(Ancestor,Person) :-
  parent(Ancestor,Person).

%recursive case
ancestor(Ancestor,Person) :-
  parent(Parent,Person),
  ancestor(Ancestor,Parent).



%decendant/2(descendent, person) descendent is a decendant of person if they are their child, or the child of the person's child etc(two rules/recursion.).
%base case, (if descendent is the child of person.)
descendent(Descendent,Person) :-
  child(Descendent,Person).

%recursive case
descendent(Descendent,Person) :-
  child(Child,Person),
  descendent(Descendent,Child).



%  TODO  aunts and uncles currently return more than one value with current test set?
%  TODO  grandfather and grandchild return more than one value with current test set?
%  TODO descendent returns two values sometimes (merna,lela).



%older/2 (X,Y) indicates person X is older than person Y


%younger/2(X,Y) indicated person X is younger than person Y
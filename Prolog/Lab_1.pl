% Luis Alfredo Rodriguez
% A01701260
% Lenguajes de Programacion
% -----------------------------------------------------------------------


hobby(juan,kaggle).
hobby(luis,hack).
hobby(elena,tennis).
hobby(midori,videogame).
hobby(simon,sail).
hobby(simon,kaggle).
hobby(laura,hack).
hobby(hans,videogame).


compatible(X,Y):-
    hobby(X,Z),
    hobby(Y,Z).

% ------------------------------------------------------------------------
road(placentia, ariminum).
road(ariminum, ancona).
road(ancona, roma).
road(castrum_Truentinum, roma).
road(brundisium, capua).
road(capua, roma).
road(messana, capua).
road(rhegium ,messana).
road(syracusae, messana).
road(lilibeum, messana).
road(catina, rhegium).

can_get_to(X,Y):-
    road(X,Y).
can_get_to(X,Y):-
    road(X,Z),
    can_get_to(Z,Y).



road_size(X,Y):-
    size(X,Y,0).

size(Y,Y,C):-
    write(C).

size(X,Y,C):-
    Acum is C+1,
    road(X,Z),
    size(Z,Y,Acum).

% ------------------------------------------------------------------------
min(A,B,C,Z):-
  A < B,
  A < C,
  Z is A.

min(A,B,C,Z):-
  B < A,
  B < C,
  Z is B.

min(A,B,C,X):-
  C < B,
  C < A,
  X is C.

% ------------------------------------------------------------------------


gcd(A,B,X):-
    A = 0,
    X is B.

gcd(A,B,X):-
    Den is B mod A,
    gcd(Den,A,X).




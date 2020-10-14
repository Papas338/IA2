:- dynamic ancestro/2.
:- dynamic hombre/2.
:- dynamic mujer/2.
:- dynamic madre/2.
:- dynamic padre/2.
:- dynamic hermano/2.
:- dynamic tia/2.
:- dynamic tio/2.

ancestro(flor,juana).
ancestro(flor,maria).
ancestro(paty,alberto).
ancestro(paty,luisa).
ancestro(ruth,miguel).
ancestro(ruth,sofia).
ancestro(maria,mario).
ancestro(maria,ana).
ancestro(luisa,pedro).
ancestro(luisa,juan).
ancestro(ana,lucas).
ancestro(luis,juana).
ancestro(luis,maria).
ancestro(antonio,alberto).
ancestro(antonio,luisa).
ancestro(jose,miguel).
ancestro(jose,sofia).
ancestro(alberto,mario).
ancestro(alberto,ana).
ancestro(miguel,pedro).
ancestro(miguel,juan).
ancestro(pedro,lucas).
hombre(luis).
hombre(antonio).
hombre(jose).
hombre(alberto).
hombre(miguel).
hombre(mario).
hombre(pedro).
hombre(juan).
hombre(lucas).
mujer(flor).
mujer(paty).
mujer(ruth).
mujer(juana).
mujer(maria).
mujer(luisa).
mujer(sofia).
mujer(ana).
madre(X,Y):-ancestro(X,Y),mujer(X).
padre(X,Y):-ancestro(X,Y),hombre(X).
hermano(X,Y):-((madre(Z,X),madre(Z,Y));(padre(W,X),padre(W,Y))), X\=Y.
tia(X,Y):-hermano(X,Z),ancestro(Z,Y),mujer(X).
tio(X,Y):-hermano(X,Z),ancestro(Z,Y),hombre(X).

% Comentarioxd

undo :- ancestro(_ ,_),fail.
undo :- hombre(_ ,_),fail.
undo :- mujer(_ ,_),fail.
undo :- madre(_ ,_),fail.
undo :- padre(_ ,_),fail.
undo :- hermano(_ ,_),fail.
undo :- tia(_ ,_),fail.
undo :- tio(_ ,_),fail.
undo.
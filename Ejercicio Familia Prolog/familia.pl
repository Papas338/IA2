% Hechos y reglas
:- nl,nl,write('Digite \'preguntar.\' para iniciar:  ?- preguntar. '), nl,nl,nl.

:- dynamic ancestro/2.
:- dynamic hombre/2.
:- dynamic mujer/2.

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

abuelo(X,Y):-padre(X,W),padre(W,Y).
abuelo(X,Y):-padre(X,W),madre(W,Y).
abuela(X,Y):-madre(X,W),padre(W,Y).
abuela(X,Y):-madre(X,W),madre(W,Y).
bisabuelo(X,Y):-padre(X,W),abuelo(W,Y).
bisabuelo(X,Y):-padre(X,W),abuela(W,Y).
bisabuela(X,Y):-madre(X,W),abuelo(W,Y).
bisabuela(X,Y):-madre(X,W),abuela(W,Y).
primo(X,Y):-tio(W,X),padre(W,Y),hombre(X).
primo(X,Y):-tia(W,X),madre(W,Y),hombre(X).
prima(X,Y):-tio(W,X),padre(W,Y),mujer(X).
prima(X,Y):-tia(W,X),madre(W,Y),mujer(X).

preguntar:-
 write('Digite el nombre del ancestro (con min�scula y terminando con punto) '),  read(Ancestro), nl,
 write('El ancestro es hombre (h) o mujer (m)? (con min�scula y terminando con punto) '), 
 read(Genero), nl, ((Genero==h)->assert(hombre(Ancestro));(Genero==m)->assert(mujer(Ancestro))),
 write('Digite el nombre de la descendiente  (con min�scula y terminando con punto)'),  read(Descendiente), nl,
 assert(ancestro(Ancestro,Descendiente)),repetir.

repetir:- write('desea incluir otro ancestro y su descendiente? (si/no) '), read(Respuesta),nl, ((Respuesta==si)->preguntar;fail).

undo :- ancestro(_ ,_),fail.
undo :- hombre(_),fail.
undo :- mujer(_),fail.
undo.
% Hechos y reglas
:- nl,nl,write('Digite \'preguntar.\' para iniciar:  ?- preguntar. '), nl,nl,nl.

:- dynamic ancestro/2.
:- dynamic hombre/1.
:- dynamic mujer/1.

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


caracteristicas(X,Inicio,Final,Lugarinicio,Especie_origen,Cantidad_afectados,Causa,Tipo,Mecanismo_transmision,Sintomas,Tratamiento):- (
	periodo(X,Inicio,Final),lugarinicio(X,Lugarinicio),origen(X,Especie_origen),cantidadafectados(X,Cantidad_afectados),
	causa(X,Causa),virusobacteria(Causa,Tipo),transmision(X,Mecanismo_transmision),tratamiento(X,Tratamiento),sintoma(X,Sintomas)
	).

enfermedad:-
	write('Digite el nombre de la enfermedad (con min�scula y terminando con punto) '),  read(Enfermedad), nl,
	(
		(
			(pandemia(Enfermedad)==true->(caracteristicas(Enfermedad,Inicio,Final,Lugarinicio,Especie_origen,Cantidad_afectados,Causa,Tipo,Mecanismo_transmision,Sintomas,Tratamiento),write(Inicio))
			
			);write('No hay resultados :c')
		)
	).

ingresarenfermedad:-(write('Digite el nombre de la enfermedad (con min�scula y terminando con punto) '),  read(Enfermedad), nl,
	write('Digite la fecha de inicio (con min�scula y terminando con punto) ')read(Inicio), nl,
	write('Digite la fecha de terminación (año o actualidad o desconocido) (con min�scula y terminando con punto) ')read(Fin), nl,
	write('Digite el lugar de inicio (con min�scula y terminando con punto) ')read(Lugar), nl,
	write('Digite el origen (especie o animal) (con min�scula y terminando con punto) ')read(Origen), nl,
	write('Digite la causa (nombre del virus o bacteria o prion) (con min�scula y terminando con punto) ')read(Causa), nl,
	write('Digite la Tipo de la causa (virus o bacteria o prion) (con min�scula y terminando con punto) ')read(Tipo_causa), nl,
	write('Digite el tiempo de incubación minimo (con min�scula y terminando con punto) ')read(Encubacionmin), nl,
	write('Digite el tiempo de incubación maximo (con min�scula y terminando con punto) ')read(Encubacionmax), nl,
	write('Digite el modo de transmision (aerea, sexual, etc) (con min�scula y terminando con punto) ')read(Transmision), nl,
	write('Digite la cantidad de muertos (con min�scula y terminando con punto) ')read(Muertos), nl,
	write('Digite la tasa de letalidad (porcentaje de 0 a 1) (con min�scula y terminando con punto) ')read(Tasa), nl,
	pandemia(Enfermedad),inicio(Enfermedad,Inicio),fin(Enfermedad,Fin),lugarinicio(Enfermedad,Lugar),
	origen(Enfermedad,Origen),causa(Enfermedad,Causa),tipo(Causa,Tipo_causa),encubacionmin(Causa,Encubacionmin),
	encubacionmax(Causa,Encubacionmax),transmision(Enfermedad,Transmision),muertos(Enfermedad,Muertos),
	tasaletalidad(Enfermedad,Tasa), nl,
	write('Si deseas ingresar sintomas, medicamentos o efectos secundarios a estos, usa otra opcion'),nl
	).
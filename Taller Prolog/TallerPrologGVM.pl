%Giancarlo Vega Marin
%Ejercicio 2.1

progenitor(clara,jose).
progenitor(tomas,jose).
progenitor(tomas,isabel).
progenitor(jose,ana).
progenitor(jose,patricia).
progenitor(patricia,jaime).

bisabuelo(X,A):-progenitor(X,Y),progenitor(Y,Z),progenitor(Z,A).
abuelo(X,A):-progenitor(X,Y),progenitor(Y,A).

%Ejercicio 2.2

valioso(oro).
genero(ana,mujer).
padre(juan,maria).
prestamo(juan,libro,maria).
prestamo(juan,lapiz,pedro).
prestamo(pedro,borrador,juan).
tieneoro(juan).

%Ejercicio 2.3
varon(albert).
varon(edward).
mujer(alice).
mujer(victoria).
padres(edward, victoria, albert).
padres(alice, victoria, albert).

%padres(Hijo, Madre, Padre).
hermana_de(X,Y):-mujer(X),padres(X,A,B),padres(Y,A,B).

%Ejercicio 2.4
miembro(X,[X|_]).
miembro(X,[_|R]):-miembro(X,R).


%Ejercicio 2.5
inversa(L1,L2):-inversa(L1,[],L2).
inversa([],L,L).
inversa([X|L1],L2,L3):-inversa(L1,[X|L2],L3).

%Ejercicio 2.6
longitud([],0).
longitud([_|R],N):-longitud(R,N1), N is N1+1.

%Ejercicio 2.7
acontecimiento(2018,'Mundial de Rusia').
acontecimiento(2022,'Mundial de Qatar').
acontecimiento(2014,'Mundial de Brasil').

fechaEvento():-
    write("Digite la fecha:  "),
    read(X),
    acontecimiento(X,Y),
    write('En '), write(X), write('  se dio el '),
    write(Y).


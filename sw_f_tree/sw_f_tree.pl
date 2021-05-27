homem(anakin).
homem(luke).
homem(ruwe).
homem(owen).
homem(cliegg).
mulher(jobal).
mulher(padme).
mulher(leia).
mulher(beru).
mulher(shmi).
criou(cliegg, vader).
criou(cliegg, owen).
criou(ruwe, padme).
criou(vader, luke).
criou(vader, leia).
criou(padme, luke).
criou(padme, leia).
criou(jobal, padme).
criou(shmi, vader).

jedi(anakin).
jedi(dooku).
jedi(kenobi).
jedi(yoda).
jedi(quigon).
jedi(windu).
jedi(luke).

sith(dooku).
sith(maul).
sith(anakin).
sith(sidious).

matou(maul, quigon).
matou(kenobi, maul).
matou(anakin, dooku).
matou(anakin, sidious).
matou(anakin, kenobi).
matou(sidious, windu).
matou(sidious, anakin).

mestre(yoda, quigon).
mestre(yoda, luke).
mestre(yoda, dooku).
mestre(quigon, kenobi).
mestre(kenobi, anakin).
mestre(kenobi, luke).
mestre(sidious, maul).
mestre(sidious, dooku).
mestre(sidious, anakin).

darkside(X) :- jedi(X), sith(X).

pai(X,Y) :- criou(X,Y), homem(X).
mae(X,Y) :- criou(X,Y), mulher(X).

filho(X,Y) :- criou(Y,X), homem(X).
filha(X,Y) :- criou(Y,X), mulher(X).

avo(X, Y) :- pai(X, Z), pai(Z, Y) | pai(X, Z), mae(Z, Y).
avoh(X, Y) :- mae(X, Z), mae(Z, Y) | mae(X, Z), pai(Z, Y).

irmao(X,Y) :- criou(Z,X), criou(Z,Y), X \== Y. 

tio(X,Y) :- irmao(X,Z), pai(Z,Y) | irmao(Z, X), mae(Z, Y).darkside

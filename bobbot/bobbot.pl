bobbot:-
	% Um pouco de suspense
	write("Esperando o Bob se arrumar..."), nl,
	sleep(1), nl,
	
	% Apresentação do Bob Bot
	bobout("Desculpe a demora, eu sou Bob! "), 
	bobout("O bot de consultoria para problemas tecnicos."),
	bobout("Me diga qual o seu problema e verei como posso ajuda-lo."),
	
	% Chamando o loop
	conversation().

% Entrada formatada paras frases do Bob
bobout(Text):-
	nl, sleep(2),
	write("Bobbot: "),
	write(Text).

% Entrada formatada paras frases do usuário
usrin(S1, S2, L):-
	nl,
	write("User:   "),
	read_string(user_input,"\n", "\r\t ", _, S1),
	% convertendo para letras minusculas 
	string_lower(S1, S2),
	% Realizando um split na string
	split_string(S2, " , ", " ", L).


% Loop onde a conversa entra o usuário e Bob é realizada
conversation():-
	usrin(_S1, _S2, L),
	% printando strings a fim de teste. Apagar isso dps!
	print(L),
	% fim do fluxo de execução
	L=@=["tchau"], bobout("Adeus humano!");
	% A ideia é chamar as respostas no lugar do bobout abaixo.
	bobout("Isso nao me significa nada"),
	conversation().

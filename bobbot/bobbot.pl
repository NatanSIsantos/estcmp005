bobbot:-
	% Um pouco de suspense
	write("Esperando o Bob se arrumar..."), nl,
	sleep(2), nl,
	
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
usrin(S1):- 
	nl,
	write("User:   "),
	read_line_to_string(user_input, S1).

% Loop onde a conversa entra o usuário e Bob é realizada
conversation():-
	usrin(S1),
	S1=@="adeus", bobout("Adeus humano!");
	% A ideia é chamar as respostas no lugar do bobout abaixo.
	bobout("Isso nao me significa nada"),
	conversation().

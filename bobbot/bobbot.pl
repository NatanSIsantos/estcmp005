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
usrin(S1, S2):-
	nl,
	write(">>   "),
	read_string(user_input,"\n", "\r\t ", _, S1),
	% convertendo para letras minusculas 
	string_lower(S1, S2).

% Loop onde a conversa entra o usuário e Bob é realizada
conversation():-
	usrin(_S1, S2),
	% Mensagens de conversação abaixo
	robotMsg(S2, _ExistRobot),
	soMsg(S2, _ExistSo),
	hardwareMsg(S2, _ExistHardware),
	computerMsg(S2, _ExistComp1, _ExistComp2),
	% Mensagens de despedida abaixo
	bye(S2, ExistBye), ExistBye >= 0;
	conversation().


% ############################################################################ %
%				RESPOSTAS DO BOB			       %
% ############################################################################ %

% Rastreando despedida do usuário
bye(String, After):-
	sub_string(String, _Before, _Length, After, "tchau"), After >=0,
	bobout("Flws");
	sub_string(String, _Before, _Length, After, "exit"), After >=0,
	write("Bob foi dormir...");
	sub_string(String, _Before, _Length, After, "sair"), After >=0,
	write("Bob já está de saída...");
	sub_string(String, _Before, _Length, After, "quit"), After >=0,
	write("Bob parou de executar...");
	sub_string(String, _Before, _Length, After, "adeus"), After >=0,
	bobout("Adeus Humano!");
	false.

% Exemplo de busca em conversação usando uma palavra-chave
% Rastreando palavras que envolvam robôs
robotMsg(String, After):-
	sub_string(String, _Before, _Length, After, "robo"), After >=0, 
	bobout("O unico robo aqui eh voce!");
	sub_string(String, _Before, _Length, After, " ia"), After >=0,
	bobout("Ela ja nos controla...");
	sub_string(String, _Before, _Length, After, "maquina"), After >=0,
	bobout("Ou voces se transformam em maquina, ou substituiremos cada um.");
	true.
	
% Rastreando palavras que envolvam sistema operacional
soMsg(String, After):-
	sub_string(String, _Before, _Length, After, "windows"), After >=0, 
	bobout("Calma la..... Windows? serio mesmo?");
	sub_string(String, _Before, _Length, After, "linux"), After >=0,
	bobout("Tudo bem que o Linux nao eh tão facil, mas voce nunca ouviu falar em Google?");
	sub_string(String, _Before, _Length, After, "tela azul"), After >=0,
	bobout("kkkkkkk tela azul? acho que tem um Windows no seu computador");
	sub_string(String, _Before, _Length, After, "dual boot"), After >=0,
	bobout("Ja pegou o seu pendrive pra gente começar esse dual boot?");
	true.

hardwareMsg(String, After):-
	sub_string(String, _Before, _Length, After, "travou"), After >=0, 
	bobout("Que tal comprar mais memória?");
	sub_string(String, _Before, _Length, After, "lento"), After >=0,
	bobout("Troca esse Celeron aí...");
	sub_string(String, _Before, _Length, After, "esquentando"), After >=0,
	bobout("Eh o cooler, confia. So tira pra limpar que resolve.");
	sub_string(String, _Before, _Length, After, "quebrou"), After >=0,
	bobout("Eh... Que tal trocar, entao?");
	true.

% Exemplo de busca em conversação usando duas palavra-chaves
% Rastreando palavras que envolvam computador
computerMsg(String, Before, After1):-
	sub_string(String, Before, Length, After1, "computador"),
	After1 >=0, sub_string(String, _Before, Length, After2, "trava"), 
	After2 >=0, bobout("Hmmm... memória RAM ou processador defeituoso");
	sub_string(String, Before, Length, After1, "computador"),
	After1 >=0, sub_string(String, _Before, Length, After2, "acessar arquivos"),
	After2 >=0, bobout("HD defeituoso");
	true.

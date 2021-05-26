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

% Mensagens de conversação abaixo
readMsg(String, Exist):-
	robotMsg(String, Exist), Exist >=0, !;
	soMsg(String, Exist), Exist >=0, !;
	hardwareMsg(String, Exist), Exist >=0, !;
	byeMsg(String, Exist), Exist >=0, !;
	bobout("Isso nao me significa nada!").

% Loop onde a conversa entra o usuário e Bob é realizada
conversation():-
	usrin(_S1, S2),
	readMsg(S2, _Exist),
	closeConversation(S2, Exist), Exist >=0;
	conversation().


% ############################################################################ %
%				RESPOSTAS DO BOB			       %
% ############################################################################ %

% Rastreando despedida do usuário
byeMsg(String, After):-
	sub_string(String, _Before, _Length, After, "tchau"), After >=0,
	bobout("Flws");
	sub_string(String, _Before, _Length, After, "exit"), After >=0,
	write("Bob foi dormir...");
	sub_string(String, _Before, _Length, After, "sair"), After >=0,
	write("Bob ja esta de saida...");
	sub_string(String, _Before, _Length, After, "quit"), After >=0,
	write("Bob parou de executar...");
	sub_string(String, _Before, _Length, After, "adeus"), After >=0,
	bobout("Adeus Humano!");
	false.

closeConversation(String, After):-
	sub_string(String, _Before, _Length, After, "tchau"), After >=0;
	sub_string(String, _Before, _Length, After, "exit"), After >=0;
	sub_string(String, _Before, _Length, After, "sair"), After >=0;
	sub_string(String, _Before, _Length, After, "quit"), After >=0;
	sub_string(String, _Before, _Length, After, "adeus"), After >=0;
	false.


% Exemplo de busca em conversação usando uma palavra-chave
% Rastreando palavras que envolvam robôs
robotMsg(String, After):-
	sub_string(String, _Before, _Length, After, "robo"), After >=0, 
	bobout("O unico robo aqui eh voce!");
	sub_string(String, _Before, _Length, After, "ia"), After >=0,
	bobout("Ela ja nos controla...");
	sub_string(String, _Before, _Length, After, "maquina"), After >=0,
	bobout("Ou voces se transformam em maquina, ou substituiremos cada um.");
	false.
	
% Rastreando palavras que envolvem sistema operacional
soMsg(String, After):-
	sub_string (String , _Before , _Length , After , "windows" ), After  > = 0 ,
	bobout( "Calma la ..... Windows? serio mesmo?" );
	sub_string(String , _Before , _Length , After , "linux" ), After  > = 0 ,
	bobout( "Tudo bem que o Linux nao eh tao facil, mas voce nunca fala em Google?" );
	sub_string(String , _Before , _Length , After , "tela azul" ), After  > = 0 ,
	bobout("kkkkkkk tela azul? acho que tem um Windows no seu computador" );
	sub_string(String , _Before , _Length , After , "inicialização dupla" ), After  > = 0 ,
	bobout("Ja pegou o seu pendrive pra gente comecar esse dual boot?" );
	sub_string(String , _Before , _Length , After , "drive de video" ), After  > = 0 ,
	bobout("Ops, provavelmente o driver correto da placa nao esta instalado, tente encontrimar o correto no site do fabricante" );
	sub_string ( String , _Before , _Length , After , "virus" ), After  > = 0 ,
	bobout("Tava acessando oq hein? kk Para acabar com o virus vc deve passar um antivirus atualizado em seu computador." );
	sub_string(String , _Before , _Length , After , "internet" ), After  > = 0 ,
	bobout("Ok, mas ja verificou se seu cabo de rede esta conectado?, se sim tente reiniciar o modem entao" );
	sub_string(String , _Before , _Length , After , "mouse travando" ), After  > = 0 ,
	bobout("Verifique se o driver esta instalado corretamente, se o problema persistir troque de mouse" );
	sub_string(String , _Before , _Length , After , "inicializacao lenta" ), After  > = 0 ,
	bobout("Ja tentou desabilitar alguns programas da inicializacao? Seria legal." );	
	false.

hardwareMsg(String, After):-
	sub_string(String, _Before, _Length, After, "travou"), After >=0, 
	bobout("Que tal comprar mais memoria?");
	sub_string(String, _Before, _Length, After, "lento"), After >=0,
	bobout("Troca esse Celeron ae...");
	sub_string(String, _Before, _Length, After, "esquentando"), After >=0,
	bobout("Eh o cooler, confia. So tira pra limpar que resolve.");
	sub_string(String, _Before, _Length, After, "quebrou"), After >=0,
	bobout("Eh... Que tal trocar, entao?");
	sub_string(String, _Before, _Length, After, "tela preta"), After >=0,
	bobout("Ja verificou se ta ligado na tomada?");
	sub_string(String, _Before, _Length, After, "tremendo"), After >=0,
	bobout("A sua tela ta tremendo? Vish... pode ser a resolucao.");
	sub_string(String, _Before, _Length, After, "usb"), After >=0,
	bobout("Sua porta USB nao funciona? so soldando de novo agora.");
	sub_string(String, _Before, _Length, After, "impressora deu erro"), After >=0,
	bobout("Verifica se a impressora tá bem conectado no PC, se tem papel e se nao der, reinicia a impressora ai man.");
	sub_string(String, _Before, _Length, After, "botao de ligar"), After >=0,
	bobout("Nao me bate mas, vc ja viu se o gabinete ta ligado na tomada?");
	false.

% Exemplo de busca em conversação usando duas palavra-chaves
% Rastreando palavras que envolvam computador
/*
computerMsg(String, Before, After1):-
	sub_string(String, Before, Length, After1, "computador"),
	After1 >=0, sub_string(String, _Before, Length, After2, "trava"), 
	After2 >=0, bobout("Hmmm... memoria RAM ou processador defeituoso");
	sub_string(String, Before, Length, After1, "computador"),
	After1 >=0, sub_string(String, _Before, Length, After2, "acessar arquivos"),
	After2 >=0, bobout("HD defeituoso");
	false.
*/

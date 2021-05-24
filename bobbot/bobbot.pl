bobbot:-
	write("Esperando o Bob se arrumar..."), nl,
	sleep(2), nl,
	bobout("Desculpe a demora, eu sou Bob! "), 
	bobout("O bot de consultoria para problemas tecnicos."),
	bobout("Me diga qual o seu problema e verei como posso ajuda-lo."),
	
	usrin(user_input).

bobout(Text):-
	nl, sleep(2),
	write("Bobbot: "),
	write(Text).	

usrin(Text):-
	nl,
	write("User:   "),
	read_line_to_string(Text, var).
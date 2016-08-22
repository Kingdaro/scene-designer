run:
	love game

dev:
	nodemon -x "make run" -e lua -w game

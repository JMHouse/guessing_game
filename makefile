README.md: 
	echo "# Peer-Graded Assignment: A Guessing Game" > README.md
	date >> README.md
	echo "  "
	echo "The number of lines of code in the program **guessinggame.sh** is:  " >> README.md
	wc -l guessinggame.sh | egrep -o "[0-9]+" >> README.md

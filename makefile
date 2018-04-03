
all: README.md guessinggame.sh

README.md: guessinggame.sh
	touch README.md
	echo "# Project Title: Guessing Game">README.md
	echo "Date & Time: " `date`>>README.md
	echo "Number of lines present in guessinggame.sh file are :: " >>README.md
	wc -l guessinggame.sh | egrep -o "[0-9]+">>README.md

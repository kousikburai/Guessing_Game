#!/bin/sh
another_guess() {
echo "Please Try with Another Guess::";
read another_num;
return $another_num;
}

echo "Guess:: How many files are in the current directory?";
read num_guess;
num_present=`ls -lrt |grep -v ^d|wc -l`;
num_present=`expr ${num_present} - 1`;
flag=0;
while [ $flag == 0 ]
do
	echo ${num_guess};
	if [ ${num_guess} == ${num_present} ]
	then
		echo "Congratulations!! Your guess is correct";
		echo "There are $num_guess files present in the current directory."
		echo "Game Over!";
		flag=1;
	elif [ ${num_guess} -gt `expr ${num_present} + 9` ]
	then
		echo "Your guess is too high!";
		another_guess
		num_guess=$?;
		echo ${num_guess};
	elif [ ${num_guess} -lt `expr ${num_present} - 9` ]
	then
		echo "Your guess is too low!";
		another_guess
		num_guess=$?;
	elif [ ${num_guess} -gt ${num_present} ]
	then
		echo "Your guess is high!";
		another_guess
		num_guess=$?;
	elif [ ${num_guess} -lt ${num_present} ]
	then
		echo "Your guess is low!";
		another_guess
		num_guess=$?;
	fi
done


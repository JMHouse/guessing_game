# Function to compare the guessed value to the actual number of files
check_guess() {
	if [[ $1 -eq $2 ]]
        then
                echo "Great job! You guessed it correctly. There are $guess files in this directory."
                break
        elif [[ $1 -lt 0 ]]
        then
                echo "It is not possible to have a negative number of files in a directory. Please try again."
        elif [[ $1 -gt $2 ]]
        then
                echo "Sorry ... your guess is too high. Let's try again."
        else
                echo "Sorry ... your guess is too low. Let's try again."
        fi
}

num_files=$(ls | wc -l)  # number of files in the directory
guesses=0  # keep track of number of guesses needed

# While loop that prompts user for a new guess until the right answer is determined
while true
do
	if [[ $guesses == 0 ]]
	then
		echo "Let's play a game where you try to guess how many files are in this directory."
		echo "Please enter your guess for the number of files:"
	else
		echo "Please enter your guess for the number of files in this directory:"
	fi

	read guess
	echo ""
	let guesses=$guesses+1         # update number of guesses needed
	check_guess $guess $num_files  # call function to compare user guess and actual number of files
	
done

# Output the number of guesses the user needed
if [[ $guesses == 1 ]]
then
	echo "You got it on the first try!"
else
	echo "It took you $guesses guesses to determine the correct answer."
fi
echo ""

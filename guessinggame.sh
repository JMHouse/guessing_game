# Function to compare the guessed value to the actual number of files
check_guess() {
	if [[ $1 -eq $2 ]]
        then
                echo "Great job! You guessed it correctly. There are $guess files in this directory."
                let ret=1
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

num_files=$(ls -A | wc -l)  # number of files in the directory
num_check='^[0-9]+$'
guesses=0  # keep track of number of guesses needed
ret=0      # variable used to determine when "while" loop ends

# While loop that prompts user for a new guess until the right answer is determined
while [[ $ret -lt 1 ]]
do
	if [[ $guesses == 0 ]]
	then
		echo "Let's play a game where you try to guess how many files are in this directory."
		echo "Please enter your guess for the number of files. Your guess must be a non-negative integer value:"
	else
		echo "Please enter another guess. Remember, your guess must be a non-negative integer value:" 
	fi

	read guess
	if ! [[ $guess =~ $num_check ]]
	then
		echo "Input error: Your guess includes characters that are not numbers."
	else
		check_guess $guess $num_files  # call function to compare user guess and actual number of files
	fi
	let guesses=$guesses+1 # update number of guesses needed
	echo ""	
done

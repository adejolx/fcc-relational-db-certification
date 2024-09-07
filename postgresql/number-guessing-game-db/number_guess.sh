#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

function START() {
# prompt user for username
echo -e "\nEnter your username:"
read NAME

USER_RESULTS=$($PSQL "select * from users where username = '$NAME'")
IFS='|' read USERNAME USER_ID < <(echo $USER_RESULTS)

if [[  $USERNAME ]]
then
	GAME_RESULTS=$($PSQL "select * from games where user_id = '$USER_ID'")
	IFS='|' read GAMES_PLAYED BEST_GAME USER_ID < <(echo $GAME_RESULTS)

	echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

# if new, register user in db 
else
	INSERT_USER_RESULTS=$($PSQL "insert into users (username) values('$NAME')")
	USER_RESULTS=$($PSQL "select * from users where username = '$NAME'")
	IFS='|' read USERNAME USER_ID < <(echo $USER_RESULTS)

	echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
fi

# and generate rand number
TARGET=$((RANDOM % 1000 + 1))

PLAY_COUNT=1
GUESS_COUNT=0

echo -e '\nGuess the secret number between 1 and 1000:\n'

function EVAL_GUESS () {
read GUESS
(( GUESS_COUNT++ ))

if [[ ! $GUESS =~ ^[0-9]+$ ]]
then
	echo -e "\nThat is not an integer, guess again:"
	EVAL_GUESS
elif [[ $GUESS -lt $TARGET ]]
then
	echo -e "\nIt's higher than that, guess again:"
	EVAL_GUESS
elif [[ $GUESS -gt $TARGET  ]]
then
	echo -e "\nIt's lower than that, guess again:"
	EVAL_GUESS
else
	return
fi
}

EVAL_GUESS

echo -e "\nYou guessed it in $GUESS_COUNT tries. The secret number was $TARGET. Nice job!\n"

if [[ $GAMES_PLAYED ]]
# register guesses in db
then
	if [[ $GUESS_COUNT -lt $BEST_GAME ]]
	# register game count each time script is called
	then
		UPDATE_GUESS_COUNT_RESULT=$($PSQL "update games set best_game = $GUESS_COUNT where user_id = $USER_ID")
	fi
	UPDATE_GAMES_PLAYED_RESULT=$($PSQL "update games set games_played = $(( GAMES_PLAYED + PLAY_COUNT )) where user_id = $USER_ID")
else
	UPDATE_GAMES_RESULT=$($PSQL "insert into games(games_played, best_game, user_id) values($PLAY_COUNT, $GUESS_COUNT, $USER_ID)")
fi

}

START

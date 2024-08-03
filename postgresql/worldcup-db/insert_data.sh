#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

$PSQL "truncate table games, teams restart identity"

function get_or_insert_team() {
	local TEAM_NAME=$1
	local INSERTION_RESULT

	TEAM_ID=$($PSQL "select team_id from teams where name = '$TEAM_NAME'")

	if [[ -z $TEAM_ID ]]
	then
		INSERTION_RESULT=$($PSQL "insert into teams(name) values('$TEAM_NAME')")

		if [[ $INSERTION_RESULT == 'INSERT 0 1' ]]
		then
			TEAM_ID=$($PSQL "select team_id from teams where name = '$TEAM_NAME'")
		fi
	fi

	echo $TEAM_ID
}

cat games.csv | while IFS=, read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != 'year' ]]
  then
    echo $YEAR $ROUND $WINNER $OPPONENT $WINNER_GOALS $OPPONENT_GOALS

    WINNER_ID=$(get_or_insert_team "$WINNER")
    OPPONENT_ID=$(get_or_insert_team "$OPPONENT")

    if [[ -z $WINNER_ID || -z $OPPONENT_ID ]]
    then
	    echo 'An insert operation did not happen correctly'
    else
	    INSERTION_RESULT=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
	    echo $INSERTION_RESULT
    fi
  fi
done

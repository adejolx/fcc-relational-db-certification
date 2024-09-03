#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table -t --no-align -c"
ELEMENT_RESULTS=

MAIN_MENU() {
	if [[ ! $1 ]]
	then
		echo -e "Please provide an element as an argument."
		return
	fi

	if [[ $1 =~ ^[0-9]+$ ]]
	then
		ELEMENT_RESULTS=$($PSQL "select * from elements where atomic_number = '$1'")

	elif [[ $1 =~ ^[A-Za-z]{1,2}$ ]]
	then
		ELEMENT_RESULTS=$($PSQL "select * from elements where symbol = '$1'")

	else
		ELEMENT_RESULTS=$($PSQL "select * from elements where name = '$1'")
	fi

	echo "$ELEMENT_RESULTS" | while IFS='|' read ATOMIC_NUMBER SYMBOL ELEMENT
do
	if [[ -z $ELEMENT_RESULTS ]]
	then
		echo "I could not find that element in the database."
	else
		PROPERTIES_RESULTS=$($PSQL "select * from properties where atomic_number = '$ATOMIC_NUMBER'")

		echo "$PROPERTIES_RESULTS" | while IFS='|' read ATOMIC_NUMBER ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS TYPE_ID
	do
		TYPES_RESULTS=$($PSQL "select * from types where type_id = $TYPE_ID")

		echo "$TYPES_RESULTS" | while IFS='|' read TYPE_ID TYPE
	do
		echo "The element with atomic number $ATOMIC_NUMBER is $ELEMENT ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $ELEMENT has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
	done

	done
	fi
done
}

MAIN_MENU $1

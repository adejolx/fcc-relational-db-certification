#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c" 

echo -e "\n~~~~ MY SALON ~~~~~\n"
echo -e "\nWelcome to My Salon, how can I help you?\n"
SERVICE_ID_SELECTED=""

function MAIN_MENU() {
	if [[ $1 ]]
	then
		echo -e "\n$1"
	fi
	echo -e "1) cut\n2) color\n3) perm\n4) style\n5) trim"
	read SERVICE_ID_SELECTED
	case "$SERVICE_ID_SELECTED" in
		1) SET_APPOINTMENT 'cut';;
		2) SET_APPOINTMENT 'color';;
		3) SET_APPOINTMENT 'perm';;
		4) SET_APPOINTMENT 'style';;
		5) SET_APPOINTMENT 'trim';;
		*) MAIN_MENU "I could not find that service. What would you like today?";;
	esac
}

SET_APPOINTMENT () {
	echo -e "\nWhat's your phone number?"
	read CUSTOMER_PHONE
	CUSTOMER_NAME=$($PSQL "select name from customers where phone = '$CUSTOMER_PHONE'")

	if [[ -z $CUSTOMER_NAME ]]
	then
		echo -e "\nI don't have a record for that phone number, what's your name?"
		read CUSTOMER_NAME
		INSERT_CUSTOMER_NAME=$($PSQL "insert into customers(phone, name) values('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
	fi

	CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE'")

	echo -e "\nWhat time would you like your $1, $(echo $CUSTOMER_NAME | sed -r 's/^ * | *$//g')?"
	read SERVICE_TIME

	INSERT_CUSTOMER_APPOINTMENT=$($PSQL "insert into appointments(customer_id, service_id, time) values($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

	echo -e "\nI have put you down for a $1 at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ * | *$//g')."
}

MAIN_MENU

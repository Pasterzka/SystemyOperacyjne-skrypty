#!/bin/bash
NAZWA="abc"
KATALOG="."
GT="0"
LT="10"
ZAWARTOSC="aa"

INPUT=0

while [ $INPUT -ne 7 ]; do
	clear
	echo "Wyszukaj plik"
	echo "1. Nazwa			${NAZWA}"
	echo "2. Katalog			${KATALOG}"
	echo "3. Większy niż			${GT}"
	echo "4. Mniejszy niż			${LT}"
	echo "5. Zawartość			${ZAWARTOSC}"
	echo "6. Szukaj"
	echo "7. Wyjdź"

	read INPUT

	case $INPUT in

		1)
		echo "Wczytaj nazwę:"
		read NAZWA
		;;
		2)
		echo "Wybierz katalog:"
		read KATALOG
		;;
		3)
		echo "Wybierz większe niż:"
		read GT
		;;
		4)
		echo "Wybierz mniejsze niż:"
		read LT
		;;
		5)
		echo "wybierz przykładową zawartość:"
		read ZAWARTOSC
		;;
		6)
		if [ -z "$KATALOG" ] || [ -z "$NAZWA" ] || [ -z "$GT" ] || [ -z "$LT" ] || [ -z "$ZAWARTOSC" ]; then
 		   echo "Jedna lub więcej zmiennych jest pusta."
		else
			echo "Szukam!"
			result=$(find "$KATALOG" -type f -name "$NAZWA" -size +"$GT" -size -"$LT" -exec grep -q "$ZAWARTOSC" {} \; -print)
			if [ -z "$result" ]; then
			    echo "Nie znaleziono pasujących plików."
			else
				echo "Znaleziono plik $result"
			fi
		fi
		read
		;;
		7)
		echo "Do widzenia!"
		;;
	esac
done

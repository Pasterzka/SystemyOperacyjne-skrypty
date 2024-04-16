#!/bin/bash
NAZWA="abc"
KATALOG="."
GT="0"
LT="10"
ZAWARTOSC="aa"


INPUT=0

#wersje menu
menu=(
 "1. Nazwa"
 "2. Katalog"
 "3. Większy niż"
 "4. Mniejszy niż"
 "5. Zawartość"
 "6. Szukaj"
 "7. Wyjdź"
)




function CaseNazwa(){ 
    INPUTPOM=0
    while [ $INPUTPOM -ne 7 ]; do
        NazwaMenu=(
         "${NAZWA}"
         "Podaj nową nazwę pliku"
         "WRÓĆ"
        )
        OPCJANAZWA=$(zenity --list --column="MENU" "${NazwaMenu[@]}" --height 300 --title "SKRYPT 3" --text "Opcje dla nazwy:")
        if  [ $? -eq 1 ]; then
            INPUTPOM=7
        fi
        case "$OPCJANAZWA" in 
            "${NazwaMenu[0]}" )
            ;;
            "${NazwaMenu[1]}" )
                NAZWA=$(zenity --entry --title "SKRYPT 3" --text "Wczytaj nową nazwę pliku:")
            ;;
            "${NazwaMenu[2]}" )
                INPUTPOM=7
            ;;
        esac
    done
}

function CaseKatalog(){
    INPUTPOM=0
    while [ $INPUTPOM -ne 7 ]; do
        KatalogMenu=(
         "${KATALOG}"
         "Podaj nową nazwę katalogu"
         "WRÓĆ"
        )
        OPCJANAZWA=$(zenity --list --column="MENU" "${KatalogMenu[@]}" --height 300 --title "SKRYPT 3" --text "Opcje dla katalogu:")
        if  [ $? -eq 1 ]; then
            INPUTPOM=7
        fi
        case "$OPCJANAZWA" in 
            "${KatalogMenu[0]}" )
            ;;
            "${KatalogMenu[1]}" )
                KATALOG=$(zenity --entry --title "SKRYPT 3" --text "Wczytaj nową nazwę katalogu:")
            ;;
            "${KatalogMenu[2]}" )
                INPUTPOM=7
            ;;
        esac
    done
}

function CaseGT(){
    INPUTPOM=0
    while [ $INPUTPOM -ne 7 ]; do
        GTmenu=(
         "${GT}"
         "Podaj większe niź"
         "WRÓĆ"
        )
        OPCJANAZWA=$(zenity --list --column="MENU" "${GTmenu[@]}" --height 300 --title "SKRYPT 3" --text "Opcje dla większe niż:")
        if  [ $? -eq 1 ]; then
            INPUTPOM=7
        fi
        case "$OPCJANAZWA" in 
            "${GTmenu[0]}" )
            ;;
            "${GTmenu[1]}" )
                GT=$(zenity --entry --title "SKRYPT 3" --text "Wczytaj większe niż:")
            ;;
            "${GTmenu[2]}" )
                INPUTPOM=7
            ;;
        esac
    done
}

function CaseLT(){
    INPUTPOM=0
    while [ $INPUTPOM -ne 7 ]; do
        LTmenu=(
         "${LT}"
         "Podaj mniejsze niź"
         "WRÓĆ"
        )
        OPCJANAZWA=$(zenity --list --column="MENU" "${LTmenu[@]}" --height 300 --title "SKRYPT 3" --text "Opcje dla mniejsze niż:")
        if  [ $? -eq 1 ]; then
            INPUTPOM=7
        fi
        case "$OPCJANAZWA" in 
            "${LTmenu[0]}" )
            ;;
            "${LTmenu[1]}" )
                LT=$(zenity --entry --title "SKRYPT 3" --text "Wczytaj mniejsze niż:")
            ;;
            "${LTmenu[2]}" )
                INPUTPOM=7
            ;;
        esac
    done
}


function CaseZawartosc(){
    INPUTPOM=0
    while [ $INPUTPOM -ne 7 ]; do
        ZawartoscMenu=(
         "${ZAWARTOSC}"
         "Podaj nową zawartość"
         "WRÓĆ"
        )
        OPCJANAZWA=$(zenity --list --column="MENU" "${ZawartoscMenu[@]}" --height 300 --title "SKRYPT 3" --text "Opcje dla zawartości:")
        if  [ $? -eq 1 ]; then
            INPUTPOM=7
        fi
        case "$OPCJANAZWA" in 
            "${ZawartoscMenu[0]}" )
            ;;
            "${ZawartoscMenu[1]}" )
                ZAWARTOSC=$(zenity --entry --title "SKRYPT 3" --text "Wczytaj zawartosc:")
            ;;
            "${ZawartoscMenu[2]}" )
                INPUTPOM=7
            ;;
        esac
    done
}




zenity --info --title "SKRYPT 3" --text "Witaj w skrypcie numer 3 w którym sprawdzamy czy istnieje podany plik :>"
zenity --question  --title "SKRYPT 3" --text "Czy chcesz wyszkuać plik?"
if  [ $? == 0 ]; then
    #zenity --progress --text "Poczekaj chwilę..." --title "SKRYPT 3" 

    while [ $INPUT -ne 7 ]; do
        OPCJA=$(zenity --list --column="MENU" "${menu[@]}" --height 300 --title "SKRYPT 3" --text "Co chcesz zrobić?")
        if  [ $? -eq 1 ]; then
            INPUT=7
        fi
        case "$OPCJA" in 
            "${menu[0]}" )
                CaseNazwa
            ;;
            "${menu[1]}" )
                CaseKatalog 
            ;;
            "${menu[2]}" )
                CaseGT
            ;;
            "${menu[3]}" )
                CaseLT
            ;;
            "${menu[4]}" )
                CaseZawartosc
            ;;
            "${menu[5]}" )
                if [ -z "$KATALOG" ] || [ -z "$NAZWA" ] || [ -z "$GT" ] || [ -z "$LT" ] || [ -z "$ZAWARTOSC" ]; then
 		            zenity --error --text "Jedna lub więcej zmiennych jest pusta."
		        else
			        result=$(find "$KATALOG" -type f -name "$NAZWA" -size +"$GT" -size -"$LT" -exec grep -q "$ZAWARTOSC" {} \; -print)
                    zenity --progress --text "Szukanie pliku. To może chwilę potrwać..." --title "SKRYPT 3" 
			        if [ -z "$result" ]; then
                        zenity --warning --text "Nie znaleziono pasujących plików."
			        else
                        zenity --info --title "SKRYPT 3" --text "Znaleziono plik $result"
			        fi
		        fi
            ;;
            "${menu[6]}" )
                INPUT=7
            ;;
        esac
        
    done
else
    zenity --info --title "SKRYPT 3" --text "Żegnaj!"
fi
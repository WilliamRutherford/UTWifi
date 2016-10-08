#!/bin/bash

DIR=UofTWirelessInfo
FILE="popUp.php?name=0010"

if [ ! -d "$DIR" ]; then

	mkdir "$DIR"
fi

cd "$DIR"

wget -qN  "http://utsc.utoronto.ca/webapps/wirelessmap/$FILE"

cat "$FILE" | grep -o '<CENTER>.*</CENTER>' | sed 's/<CENTER>//' | sed 's:</CENTER>::'

cat "$FILE" | grep -o 'Average number of connections per AP :.*<p' | sed 's/<P.*//'

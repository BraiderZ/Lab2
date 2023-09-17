#!/bin/bash

monitoreo () {

	while true; do
		if pgrep -x $1 > /dev/null; then
			echo "$1 se esta ejecutando"
		else
			echo "$1 no se esta ejecutando. Ejecutando proceso..."
			$2 $3
		fi

		sleep 10
	done
}

if [ $# -lt 2 ]; then
	echo "Error: agregue almenos  dos argumentos: <nombre del proceso> <comando para ejecutarlo>"
	exit 1
fi

proceso=$1
comando=$2
shift
shift
resto_comando=$@


monitoreo "$proceso" "$comando" "$resto_comando"

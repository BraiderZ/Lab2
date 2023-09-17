#!/bin/bash




if [ $# -lt 1 ]; then
	echo "Error: agregue un PID como argumento."
	exit 1
elif [ $# -gt 1 ]; then
        echo "Error: solo puede agregar un PID a la vez."
        exit 1
fi


if ps -p $1 > /dev/null; then
	nombre_proceso=$(ps -o comm= -p $1)
	echo "Nombre del proceso: $nombre_proceso"
	id_proceso=$(ps -o pid= -p $1)
        echo "PID del proceso: $id_proceso"

else
	echo "EL proceso no existe"
fi


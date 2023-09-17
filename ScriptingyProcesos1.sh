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
        echo "ID del proceso: $id_proceso"
	parent_proceso=$(ps -o ppid= -p $1)
        echo "ID del proceso padre: $parent_proceso"
	usuario_proceso=$(ps -o user= -p $1)
        echo "Usuario propietario: $usuario_proceso"
	cpu_proceso=$(ps -o %cpu= -p $1)
        echo "POrcentaje de CPU en uso: $cpu_proceso"
	memoria_proceso=$(ps -o %mem= -p $1)
        echo "Consumo de memoria: $memoria_proceso"
	estado_proceso=$(ps -o stat= -p $1)
        echo "Estado del proceso: $estado_proceso"
        path_proceso=$(ps -o cmd= -p $1)
        echo "Path del ejecutable: $path_proceso"

else
	echo "EL proceso no existe"
fi


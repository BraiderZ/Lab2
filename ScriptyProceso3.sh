#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Agregue como argumento un ejecutable"
	exit 1
fi

if [ -e $1 ]; then
	echo "Realizando registro"
else
	echo "Este archivo no existe"
	exit 1
fi

log="registro.log"

# Ejecutamos el argumento
./"$1" &

pid_ejecutable=$!

echo "$pid_ejecutable"

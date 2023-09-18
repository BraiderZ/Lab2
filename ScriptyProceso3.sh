#!/bin/bash

if [ $# -lt 1 ]; then
	echo "Agregue como argumento un ejecutable"
	exit 1
fi

ejecutable=$@

if [ -x "$ejecutable" ]; then
	echo "Este archivo es ejecutable"
else
	echo "ESte archivo no es ejecutable"
	exit 1
fi


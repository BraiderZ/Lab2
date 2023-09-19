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

grafica_cpu="grafica_cpu.png"
grafica_mem="grafica_mem.png"

# Ejecutamos el argumento
./"$1" &

pid_ejecutable=$!
tiempo=0

echo "Tiempo Porcentaje_CPU Porcentaje_Memoria " > "$log"

for i in {1..30}
do
	tiempo=$((tiempo + 1))
	cpu_porcentaje=$(ps -p $pid_ejecutable -o %cpu --no-headers)
    	mem_porcentaje=$(ps -p $pid_ejecutable -o %mem --no-headers)
    	echo "$tiempo $cpu_porcentaje $mem_porcentaje" >> "$log"
    	sleep 1
done

gnuplot << EOF
set terminal pngcairo enhanced font "arial,12" size 600,500
set output "$grafica_cpu"
set xlabel "Tiempo"
set xrange [0:30]
set ylabel "Valor"
set yrange [0:100] 
set title "Gráfica de Porcentaje CPU"
plot "$log" using 1:2 with lines title "Valores"
EOF

gnuplot << EOF
set terminal pngcairo enhanced font "arial,12" size 600,500
set output "$grafica_mem"
set xlabel "Tiempo"
set xrange [0:30]  
set ylabel "Valor"
set yrange [0:10]
set title "Gráfica de Porcentaje Memoria"
plot "$log" using 1:3 with lines title "Valores"
EOF


echo "Gráficas generadas en los pngs: $grafica_cpu $grafica_mem"

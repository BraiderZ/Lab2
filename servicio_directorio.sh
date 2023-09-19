#!/bin/bash

log="/home/luis/Lab2/Lab2/registro_directorio.log"
echo "Tipo de cambio Fecha Hora" > "$log"
while true; do
    evento=$(inotifywait -q -e modify,create,delete,move -t 0 ~/prueba_scriptyservicios)
  
  # Verificar si se ha producido un evento antes de registrar
  if [ -n "$evento" ]; then
    fecha_hora=$(date +"%Y-%m-%d %H:%M:%S")
    echo "$evento $fecha_hora" >> "$log"
  fi
done

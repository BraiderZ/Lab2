#!/bin/bash

log="registro_directorio.log"
echo "Tipo de cambio Fecha Hora" > "$log"
while true; do
  evento=$(inotifywait -q -e modify,create,delete,move ~/prueba_scriptyservicios)
  fecha_hora=$(date +"%Y-%m-%d %H:%M:%S")
  echo "$evento $fecha_hora" >> "$log"
done

#!/bin/bash


while true; do
  evento=$(inotifywait -q -e modify,create,delete,move ~/prueba_scriptyservicios)
  fecha_hora=$(date +"%Y-%m-%d %H:%M:%S")
  echo "Cambio detectado en $evento en $fecha_hora"
done

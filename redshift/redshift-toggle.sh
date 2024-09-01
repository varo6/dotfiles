#!/bin/bash
# Script para encender o apagar redshift usando una variable.
# Para usarlo como comando global, renombrarlo sin la extensión sh y añadirlo en /.local/bin/

# Ruta donde guardamos el estado de redshift (0 o 1)
STATE_FILE="$HOME/.config/redshift/.redshift_state"

# Si el archivo de estado no existe, lo creamos y asumimos que está apagado
if [ ! -f "$STATE_FILE" ]; then
    echo "0" > "$STATE_FILE"
fi

# Leemos si está encendido o apagado
RED_SHIFT_STATUS=$(cat "$STATE_FILE")

if [ "$RED_SHIFT_STATUS" -eq "0" ]; then
    # Si el estado es 0, encendemos redshift
    redshift -o -t 3700:3700 -l 0.0:0.0 &
    echo "Redshift encendido"
    # Actualizamos el estado a 1
    echo "1" > "$STATE_FILE"
else
    # Si el estado es 1, apagamos redshift
    redshift -x
    echo "Redshift apagado"
    # Actualizamos el estado a 0
    echo "0" > "$STATE_FILE"
fi



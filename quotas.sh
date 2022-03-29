#!/usr/bin/env bash
#Autor: María Jesús, Jose Antonio, Gonzalo
#Versión:
#Descripción: práctica cuotas - script
#Fecha de Creación: 28-03-2022
#Fecha de Modificación
#Zona de declaración de variables.
ruta="/home/usuario/scripts/"
directorio="/root1"

#Fin Zona.

#Zona de declaración de funciones.


#Función existe directorio
function f_existe {
    if [ -d "$directorio" ]
    then
        echo "El directorio existe"
    else
        echo "El directorio no existe"
    fi
}
#Función UUID



#Función modificar fstab


#Función habilita quota



#Función plantilla quota



#Función configura quota





#Fin Zona.
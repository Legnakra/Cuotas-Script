#!/usr/bin/env bash
#Autor: María Jesús, Jose Antonio, Gonzalo
#Versión:
#Descripción: práctica cuotas - script
#Fecha de Creación: 28-03-2022
#Fecha de Modificación
#Zona de declaración de variables.
ruta="/home/usuario/"
directorio="QUOTA"

#Fin Zona.

#Zona de declaración de funciones.

#Función existe directorio
function f_existe {
    if [ -d "$directorio" ]
    then
        echo "El directorio existe"
        return 0
    else
        echo "El directorio no existe"
        return 1
    fi
}

#Función comprobar root
function f_miraRoot {
    if dpkg -l &> /dev/null; then
    return 0
    else
    return 1
fi
}

#Función listar dispositivos de bloques
function f_listardispositivos {
    lsblk
}

#Función UUID (Falta depurar ya que no funciona aún)
function f_UUID {
    echo 'Introduzca el nombre del dispositivo de bloques: '
    read dispositivo
    sudo blkid /dev/$dispositivo | cut -d' ' -f2 | cut -d\" -f2;
}
#Función modificar fstab


#Función habilita quota



#Función plantilla quota



#Función configura quota





#Fin Zona.

f_existe 
f_miraRoot
#!/usr/bin/env bash
#Autor: María Jesús Alloza, Jose Antonio Canalo, Gonzalo Peña
#Versión:
#Descripción: práctica cuotas - script
#Fecha de Creación: 28-03-2022
#Fecha de Modificación: 08-04-2022
#Zona de declaración de variables.
ruta="/home/usuario/"
directorio="QUOTA"
q_user="/QUOTA/aquota.user"
q_group="/QUOTA/aquota.group"

#Fin Zona.

#Zona de declaración de funciones.

#Función comprobar root
function f_miraRoot {
    if [ $(id -u) = 0 ]; then
        return 0;
    else
        echo "Ingrese como root (Necesario para ejecutar el script.)"
        exit
    fi
}


#Función existe directorio
function f_existe {
    if [ -d $directorio ]; then
        echo "El directorio existe."
        return 0;
    else
        read -p "El directorio no existe. ¿Quiere crearlo (Y/N)?" var;
        if [[ $var = "Y" ]]; then
            $(mkdir /QUOTA);
            return 0;
        else
            echo "Salir.";
            exit
        fi
    fi
}


#Función listar dispositivos de bloques
function f_listardispositivos {
    sudo lsblk -f;
}


#Función UUID
function f_UUID {
    read -p 'Introduce el dispositivo: ' dispositivo
    UUID=$(blkid /dev/$dispositivo | cut -d' ' -f2 | cut -d\" -f2)
    echo $UUID
        exit
}


#Función modificar fstab
function f_modifica_fstab {
        if f_chkfstab ; then
                echo "El dispositivo existe fstab."
        else
                echo "El dispositivo no existe en fstab."
                read -p "¿Desea agregarlo? (Y/N): " var
                if [[ $var = "Y" ]]; then
                        echo "UUID=$v_UUID /QUOTA ext4 defaults 0 0" >> /etc/fstab
                        mount -a
                        echo "Agregado al fstab."
                else
                        echo "No se agregó a fstab."
                        exit
                fi
        fi
}


#Función comprobar conexión.
function f_internet {
        echo "Comprobando conexión..."
        if ping -c 1 8.8.8.8 ; then
                return 1;
        else
                echo "No hay conexión a internet."
                exit
        fi
}


#Función comprobar si esta instalado el comando quotas.
function f_quotainstalado {
        if [[ $(type -p quota &> /dev/null;echo $?) -ne 0 ]] ; then
                read -p "El paquete quota no esta instalado. ¿Quieres instarlarlo? (Y/N): " var
                        if [[ $var = "Y" ]]; then
                        if f_internet ; then
                                if apt update -y &> /dev/null ; then
                                        apt install -y quota &> /dev/null
                                        echo "Paquete instalado."
                                else
                                        echo "No es posible conectar con el  repositorios."
					exit
                                fi
                        fi
                else
                        echo "Necesita el paquete para continuar."
                        exit
                fi
        fi
}


#Función habilita quota.
function f_habquota {
        if [ -f "$q_user" "$q_group" ]
        then
                echo "Los directorios aquota.user y aquota.group existen."
                return 0;
        else
                quotacheck -ug "$directorio" && quotaon "$directorio"
                return 1;

        fi
}


#Función para crear copia de seguridad de fstab.
function f_cpfstab {
        read -p "Vamos a modificar el fichero fstab, ¿desea hacer una copia de él? (Y/N): " var
                if [[ $var = "Y" ]]; then
                cp /etc/fstab /etc/fstab.old
        fi
} 


#Función plantilla quota
function  f_plantillaquota {
        read -p "Indique el usuario que quiere usar como plantilla: " user
		if [[ $(cat/etc/passwd |grep $user) ]]; 
		then
			echo "El usuario ya existe"
		else
			useradd -s /bin/bash -m $user echo "Usuario creado"
		fi
	echo $user
}


#Función configura quota
function f_configura_quota {
	read -p "¿Que capacidad en MB desea asignarle al usuario $v_user?:"
		var
		if [[ $var =$i~ ^[0-9]+$ ]]; 
		then
			echo "$v_uer $var" >> /QUOTA/aquota.user
			echo "$v_user $var" >> /QUOTA/aquota.group
			echo "Capacidad asignada."	
		else
			echo "No es un numero."
		fi
}


#Fin Zona.


f_miraRoot
f_existe
f_listardispositivos
f_UUID
echo $(f_UUID)
f_modfstab
f_internet
f_quotainstalado
f_habquota
f_cpfstab
f_plantillaquota
f_configura_quota

# Quotas automatizadas

## Introducción
El siguiente script está diseñado para configurar quotas en Debian 11 y hacerlo
de forma automática. 

Gracias por adelantado a: 
* [Gonzalo Peña Calero](github.com/Gpc23)
* [Jose Antonio Calero González](github.com/joseantoniocgongalez)

## Planteamiento
Las funciones que hemos creado son:
* Comprobar que el usuario está como *root*.
* Comprobar que existe el directorio _/QUOTA_.
* Listar los dispositivos de bloques en el que se desea implementar la cuota.
* Obtener su _UUID_.
* Modificar _/etc/fstab_.
* Comprobar si existen los ficheros _aquota.user_ y _aquota.group_.
* Habilitar y montar quota.
* Crear un usuario donde copiaremos su quota al resto de usuarios.
* Configurar la quota.

## Autores :computer::computer_mouse:
* María Jesús Alloza
* Gonzalo Peña
* Jose Antonio Calero  
:school: I.E.S. Gonzalo Nazareno (Dos Hermanas, Sevilla).

#!/usr/bin/env bash
#-------------------------------------------------------------------------------
# SCRIPT DE MONTAR UNIDAD
#-------------------------------------------------------------------------------
# Autor:       vincitori-dev
# Versión:     1.0
# Fecha:       20/11/2021
# Descripción: Script que monta la unidad de disco en el sistema
# Run info:    Este script se ejecuta cada vez que se inicia el sistema
#-------------------------------------------------------------------------------
# Variables locales
#-------------------------------------------------------------------------------
    DIR="${BASH_SOURCE%/*}" #Directorio del script
    FECHA=$(date +"%x-%X")  #Fecha y hora actual
#-------------------------------------------------------------------------------
# Funciones
#-------------------------------------------------------------------------------
function addMsg(){
    # Agrega un mensaje a la lista de mensajes
    echo "$FECHA: $1"
}
function checkUser(){
    # Verifica si el usuario es root
    if [ "$(id -u)" != "0" ]; then
        addMsg "Este script debe ser ejecutado como root"
        exit 1
    fi
}
function addConfig(){
    # Comprobamos si existe el fichero de configuración
    addMsg "Comprobando si existe el fichero de configuración"
    if [[ -e "$DIR/../etc/config.cfg" ]]; then
        # Si existe, conectamos el script con el fichero de configuración
            . "$DIR/../etc/config.cfg"
            addMsg "Se ha conectado con el fichero de configuración"
    else
        # Si no existe, mostramos un mensaje de error
            addMsg "No se ha encontrado el fichero de configuración"
            addMsg "Se aborta la ejecución del script"
            exit 1
    fi
}
function checkFolder(){
    # Comprobamos si existe el directorio de montaje
    if [[ -d "$DIR_TO_MOUNT_DISK" ]]; then
            addMsg "El directorio $DIR_TO_MOUNT_DISK de montaje ya existe"
    else
        # Si no existe, lo creamos
            addMsg "Creando el directorio $DIR_TO_MOUNT_DISK seleccionado"
            mkdir "$DIR_TO_MOUNT_DISK"
    fi
}
#-------------------------------------------------------------------------------
# Main Script
#-------------------------------------------------------------------------------
function inicioMontarUnidad() {
    checkUser # Verificamos si el usuario es root
    addConfig # Añadimos las variables de configuración
    addMsg "Iniciando el script de montar unidad"
    checkFolder # Comprobamos si existe el directorio de montaje
    #montamos el disco duro en la carpeta que hemos creado
    mount -t ntfs "$DISK_TO_MOUNT" "$DIR_TO_MOUNT_DISK"
}
#redirigimos la salida estándar y la de error a un fichero de log
inicioMontarUnidad 1>"$DIR/../logs/output.log" 2>"$DIR/../logs/errors.log"

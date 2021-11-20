#-------------------------------------------------------------------------------
# SCRIPT DE MONTAR UNIDAD
#-------------------------------------------------------------------------------
# Autor:       vincitori-dev
# Versión:     1.0
# Fecha:       20/11/2021
# Descripción: Script que monta la unidad de disco en el sistema
# Run info:    Este script se ejecuta cada vez que se inicia el sistema
#-------------------------------------------------------------------------------
#!/usr/bin/env bash
#-------------------------------------------------------------------------------
# Variables locales
#-------------------------------------------------------------------------------
    DIR="${BASH_SOURCE%/*}" #Directorio del script
#-------------------------------------------------------------------------------
# Funciones
#-------------------------------------------------------------------------------
function addConfig(){
    # Comprobamos si existe el fichero de configuración
    if [[ -e "$DIR/../etc/config.cfg" ]]; then
        # Si existe, conectamos el script con el fichero de configuración
            . "$DIR/../etc/config.cfg"
    else
        # Si no existe, mostramos un mensaje de error
            echo "El fichero de configuración no existe"
    fi
}
function checkFolder(){
    # Comprobamos si existe el directorio de montaje
    if [[ -d "$DIR_TO_MOUNT_DISK" ]]; then
            echo "El directorio $DIR_TO_MOUNT_DISK de montaje ya existe"
    else
        # Si no existe, lo creamos
            echo "Creando el directorio $DIR_TO_MOUNT_DISK seleccionado"
            sudo mkdir "$DIR_TO_MOUNT_DISK"
    fi
}
#-------------------------------------------------------------------------------
# Main Script
#-------------------------------------------------------------------------------
function inicioMontarUnidad() {
    addConfig # Añadimos las variables de configuración
    echo "Montando unidad de disco"
    checkFolder # Comprobamos si existe el directorio de montaje
    #montamos el disco duro en la carpeta que hemos creado
    sudo mount -t ntfs "$DISK_TO_MOUNT" "$DIR_TO_MOUNT_DISK"
}
#redirigimos la salida estándar y la de error a un fichero de log
inicioMontarUnidad 1>"$DIR/../logs/output.log" 2>"$DIR/../logs/errors.log"

# InicioMontarUnidad

Script de bash para montar una unidad al inicio del sistema
## Comenzando 🚀

_Estas instrucciones te permitirán obtener una copia del proyecto en funcionamiento en tu máquina local_

Descarga el proyecto y guardalo en la carpeta en la que te apatezca.


### Pre-requisitos 📋

Este script bash ha sido diseñado para **Pop!_OS 21.04** pero deberia poder
ejecutarse en cualquier distro linux


### Instalación y Configuración 🔧

Una vez descargado el proyecto encontramos la siguiente estructura de carpetas
```
.
├── etc
│   └── config.cfg
├── logs
│   ├── errors.log
│   └── output.log
├── src
│   └── inicioMontarUnidad.sh
└── readme.md
```    
En la carpeta _etc_ dedicada a archivos de configuración encontramos el
archivo _config.cfg_ en el cual debemos rellenar los campos 
**DIR_TO_MOUNT_DISK** donde estableceremos la carpeta donde se montará
la nueva unidad de disco y **DISK_TO_MOUNT** donde establecemos el nombre de 
la unidad a montar. Aqui podemos ver un ejemplo:
```
DIR_TO_MOUNT_DISK="/media/vincitori/Mi_Directorio"
DISK_TO_MOUNT="/dev/sdb1"
```
En la carpeta _logs_ se encuentran 2 ficheros de logs, en _errors.log_ se guardan
los errores que se hayan podido producir durante la ejecución del script y en 
_output.log_ se guarda la salida normal del script.

En la carpeta _src_ se encuentra el codigo fuente del script. Debemos 
asegurarnos de hacer ejecutable el fichero _inicioMontarUnidad.sh_. Para ello
puedes utilizar el siguiente comando ejecutado en el directorio _src_:

```
sudo chmod +x inicioMontarUnidad.sh
```



## Funcionamiento Manual ⚙️

Si queremos ejecutar este script de forma manual, navegamos a la ruta donde
hayamos descargado el proyecto y ejecutamos las siguientes instrucciones en una
terminal.

Navegamos a la carpeta _/src/_
```
cd src
```
y luego, como usuario **root**, ejecutamos el script. Para ello usamos la 
siguiente instrucción

```
sudo ./inicioMontarUnidad.sh
```

## Funcionamiento Automático ⚙️

Si queremos que este script se ejecute al inicio debemos seguir los siguientes
pasos

_En desarrollo_

## Wiki 📖

Puedes encontrar mucho más de cómo utilizar este proyecto en nuestra [Wiki](https://github.com/tu/proyecto/wiki)

## Autores ✒️


* **Victor Fagúndez Poyo** - *Trabajo Inicial* - [vincitori-dev](https://github.com/vincitori-dev)


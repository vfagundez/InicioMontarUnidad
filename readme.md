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
pasos:

Usaremos la herramienta _crontab_ disponible con la mayoria de distribuciones 
linux que nos permite acceder al _cron_. _crontab_ nos permite planificar la 
ejecución de script dentro de nuestro sistema.

Abrir _crontab_ es sencillo. Para empezar, abre una terminal e ingresa el 
siguiente comando:

```
sudo crontab -e
```

**Nota**: Es importante usar el comando <kbd>crontab -e</kbd> precedido de 
<kbd>sudo</kbd> si queremos usar el comando como usuario **root**. Que en 
nuestro caso lo necesitamos para montar la unidad y crear la carpeta si no esta 
creada.

Si es la primera vez que usamos crontab, necesitaremos especificar un editor 
con el que trabajar el fichero. En este ejemplo escogeremos el editor _nano_
dado que no presenta demasiada complejidad. 

Con el editor seleccionado, _cron_ cargará el fichero por defecto con
instrucciones detalladas sobre como funciona todo.

Dentro del fichero en editor _nano_, hacemos scroll hasta bajar al final del 
archivo donde escribiremos la ruta a nuestro archivo precedido de 
<kbd>@reboot</kbd> como en el ejemplo siguiente:

```
@reboot /home/vincitori/Documentos/InicioMontarUnidad/src/inicioMontarUnidad.sh
```
El comando <kbd>@reboot</kbd> es clave dado que indica al cron que ejecute este
script cada vez que se reinicie.

Ahora que el comando está establecido, el _crontab_ debe ser guardado. Para 
ello pulsamos la combinación de teclas <kbd>Ctrl + o</kbd> en el teclado. Esto
mostrará un mensaje solicitando el nombre con el que guardar el archivo. **No
cambies nada**, simplemente pulsa la tecla <kbd>Enter</kbd> para guardarlo con
el nombre por defecto.

Para salir de nano pulsa las teclas <kbd>Ctrl + x</kbd> para salir.

Reinicia el ordenador y comprueba que la unidad se monta automaticamente.

## Autores ✒️


* **Victor Fagúndez Poyo** - *Trabajo Inicial* - [vincitori-dev](https://github.com/vincitori-dev)


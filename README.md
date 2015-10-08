# fluks
Files with luks
Gestión de ficheros cifrados con luks
Comandos sacados del tutorial http://elephly.net/posts/2013-10-01-dm-crypt.html

## Comandos
### help
Muestra ayuda breve de los comandos disponibles.

    flucks help

### create

Generar un volumen de N MB.

    flucks create ficheroCifrado 50

### format    

Formatea el volumen a ext4, este paso hay que realizarlo tras generar el volumen.

    flucks format ficheroCifrado

### mount

Monta el volumen en el directorio indicado, para ello genera un dispositivo en */dev/mapper/secret-device*.

    flucks mount fichero punto_de_montaje

### umount

Desmontar un volumen que hayamos montado y asociado al dispotivo */dev/mapper/secret-device*.

    flucks umount punto_de_montaje

## ToDo
* Gestionar varios volúmenes a la vez.
* Listado de unidades activas.
* Añadir autocompletado de argumentos (si es posible).

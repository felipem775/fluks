# fluks
Files with luks  
Gestión de ficheros cifrados con luks  
Comandos sacados del tutorial http://elephly.net/posts/2013-10-01-dm-crypt.html

## Comandos
### help
Muestra ayuda breve de los comandos disponibles.

    fluks help

### create

Generar un volumen de N MB.

    fluks create ficheroCifrado 50

### format    

Formatea el volumen a ext4, este paso hay que realizarlo tras generar el volumen.

    fluks format ficheroCifrado

### mount

Monta el volumen en el directorio indicado, para ello genera un dispositivo en */dev/mapper/secret-device*.

    fluks mount fichero punto_de_montaje

### umount

Desmontar un volumen que hayamos montado y asociado al dispotivo */dev/mapper/secret-device*.

    fluks umount punto_de_montaje

## Autocompletado
Para tener autocompletado de los argumentos es necesario copiar el fichero *fluks* en el directorio que utilice el sistema para *bash completion*.

## ToDo
* Gestionar varios volúmenes a la vez.
* Listado de unidades activas.

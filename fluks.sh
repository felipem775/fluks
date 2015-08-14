#!/bin/bash

# Version 0.1
# Comandos sacados de http://elephly.net/posts/2013-10-01-dm-crypt.html

function create {
    echo "Creando volumen $1 de tamaño $2MB"
    if [ "$2" -gt "0" ]; then
        dd if=/dev/zero bs=1M count=$2 of=$1
        sudo cryptsetup luksFormat $1
    else
        echo "Parametro 2 debe ser un número"
    fi
}

function format {
    echo "Formatear volumen"
    sudo cryptsetup luksOpen $1 secret-device
    sudo mkfs.ext4 /dev/mapper/secret-device
    sudo cryptsetup luksClose secret-device
}

function mount {
    if [ "$2" = "" ]; then
        echo "Falta parámetro 3"
        exit
    fi

    if [ -d "$2" ]; then
        echo "El directorio donde se quiere montar ya existe"
        exit
    fi
        echo "Montando $1 en $2"
        mkdir $2
        sudo chown -R "$USER" "$2"
        sudo cryptsetup luksOpen $1 secret-device
        sudo mount /dev/mapper/secret-device $2


}

function umount {
    echo "Desmontando $1"
    sudo umount $1
    if sudo cryptsetup luksClose secret-device ; then
        rm -rf $1
    else
        echo "No se ha eliminado el directorio"
    fi
}

function help {
    echo "Gestiona ficheros con luks"
    echo "=========================="
    echo "create fichero tamaño_en_MB"
    echo "format fichero"
    echo "mount fichero punto_de_montaje"
    echo "umount punto_de_montaje"
}


if [ "$1" = "create" ]; then
    create $2 $3

elif [ "$1" = "format" ]; then
    format $2

elif [ "$1" = "mount" ]; then
    mount $2 $3

elif [ "$1" = "umount" ]; then
    umount $2

else
    help
fi

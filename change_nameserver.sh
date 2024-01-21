#!/bin/bash

# Verificar si el usuario tiene privilegios de superusuario
if [ "$(id -u)" != "0" ]; then
    echo "Este script debe ejecutarse como superusuario." >&2
    exit 1
fi

# Nuevos valores para nameserver y domain (ajusta según tus necesidades)
nuevo_nameserver="8.8.8.8"
#nuevo_domain="example.com"

# Crear un nuevo contenido para resolv.conf
nuevo_contenido="nameserver $nuevo_nameserver"

# Sobrescribir el archivo resolv.conf
printf "%s\n" "$nuevo_contenido" > /etc/resolv.conf

echo "Archivo /etc/resolv.conf modificado automáticamente con éxito."

#!/bin/bash

read -s -p "Introduzca clave de root de mariaDB: " passmysql

echo -e "\n---------- CREACIÓN DE ALIAS DE CORREO -------------\n"

echo "Elija el id del dominio para el cual quiere crear un alias:"

echo "SELECT * FROM mailserver.virtual_domains;" | mysql -uroot -p$passmysql

echo -n "Número: "
read id

echo -n "Escriba la dirección de correo a crear: "
read correo

echo -n "Escriba las direcciones de destino, una, o varias separadas por comas, <= 255: "
read destinos

echo "INSERT INTO mailserver.virtual_aliases(domain_id, source, destination) VALUES('$id','$correo','$destinos');" | mysql -u root -p$passmysql

echo "Sé feliz"

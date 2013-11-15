#!/bin/bash

read -s -p "Introduzca clave de root de mariaDB: " passmysql


echo -e "\n---------- CREACIÓN DE DOMINIOS DE CORREO -------------\n"

echo "Dominios actuales:"

echo "SELECT * FROM mailserver.virtual_domains;" | mysql -uroot -p$passmysql

echo -n "Teclee su nuevo dominio: "
read dominio

echo "INSERT INTO mailserver.virtual_domains(name) VALUES('$dominio');" | mysql -uroot -p$passmysql
mkdir -p /var/mail/vhosts/$dominio
echo "Sé Feliz"

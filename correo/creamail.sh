#!/bin/bash

read -s -p "Introduzca clave de root de mariaDB: " passmysql


echo -e "\n---------- CREACIÓN DE CUENTAS DE CORREO -------------\n"

echo "Elija id del dominio para el cual quiere crear cuentas de correo:"

echo "SELECT * FROM mailserver.virtual_domains;" | mysql -uroot -p$passmysql

echo -n "Número: "
read id

while true; do
        echo -n "Escriba la nueva dirección de correo: "
        read email
        echo -n "Escriba contraseña invisible: "
        read -s contrasena
        echo " "
        echo "INSERT INTO mailserver.virtual_users(domain_id, password , email)VALUES('$id', ENCRYPT('$contrasena', CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), '$email');" | mysql -uroot -p$passmysql
        echo "---- Cuenta creada ----"
        echo -n "¿Desea crear otra? (s/n): "
        read respuesta
        if [ "$respuesta" = "n" ] ; then
                echo "Sé Feliz"
                break
        fi
done

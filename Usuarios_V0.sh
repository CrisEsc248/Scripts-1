#! /bin/bash

#La contraseña debe tener 8 caracteres o más

echo ¿Cuál es el nombre del usuario?
read "nombre"

echo ¿Cuál es la contraseña que quiere añadir?
read "contrasena"

if [ -n "$contrasena" ] && [ ${#contrasena} -gt 7 ]; then
	sudo useradd "$nombre"
	"$nombre:$contrasena" | sudo chpasswd
else
	echo "La contraseña no cumple con los requerimientos"
	exit 0
fi

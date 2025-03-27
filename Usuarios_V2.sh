#! /bin/bash

#La contraseña debe tener 8 caracteres o más

echo ¿Cuál es el nombre del usuario?
read "nombre"

echo ¿Cuál es la contraseña que quiere añadir?
read "contrasena"

echo ¿El usuario puede ejecutar comandos con sudo?
read "sudo"

if [ -n "$contrasena" ] && [ ${#contrasena} -gt 7 ]; then
	useradd "$nombre"
	echo "$nombre:$contrasena" | sudo chpasswd

	if [ ${sudo} == "s" ]; then
		usermod -aG sudo "$nombre"
	fi
else
	echo "La contraseña no cumple con los requerimientos"
	exit 0
fi

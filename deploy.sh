#!/bin/bash

# Detener NGINX y NGROK si están en ejecución
sudo systemctl stop nginx
pkill ngrok

echo "Servicios detenidos."

# Navegar al directorio de la aplicación (ajusta la ruta según >cd /var/www || exit

echo "Directorio cambiado a $(pwd)."

# Comprobar si el repositorio existe
if [ ! -d "PAGINA-WEB" ]; then
    echo "El repositorio no existe. Clonando..."
     sudo git clone https://github.com/ItzelMedinaMex/PAGINA-WE>fi

# Entrar al directorio del repositorio
cd PAGINA-WEB || exit

echo "Directorio cambiado a $(pwd)."

# Obtener los últimos cambios del repositorio
sudo git pull origin main || { echo "Error al hacer git pull.";>
echo "Repositorio actualizado."

# Mover los archivos a nginx
sudo rm -rf /var/www/html/*
sudo cp -r * /var/www/html/

# Iniciar NGINX
sudo systemctl start nginx || { echo "Error al iniciar NGINX.";>
echo "NGINX iniciado."

# Iniciar NGROK para exponer el puerto 80
ngrok http 80 --log=stdout &> /tmp/ngrok.log &

sleep 5

NGROK_URL=$(curl -s http://localhost:4040/api/tunnels | jq -r .>

echo "URL obtenida: $NGROK_URL"
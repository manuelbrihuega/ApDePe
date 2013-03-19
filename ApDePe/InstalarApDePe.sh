#!/bin/bash

echo "++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+Script para la instalación de la tienda ApDePe+"
echo "++++++++++++++++++++++++++++++++++++++++++++++++"

echo "Instalando las gemas necesarias..."
bundle install

echo "Limpiando bases de datos..."
rake db:drop:all
echo "Creando bases de datos..."
rake db:create
echo "Migrando bases de datos..."
rake db:migrate
echo "Cargando datos"
rake db:data:load

#!/bin/bash

echo "++++++++++++++++++++++++++++++++++++++++++++++++"
echo "+Script para el lanzamiento de la tienda ApDePe+"
echo "++++++++++++++++++++++++++++++++++++++++++++++++"

echo "Iniciando motor de busqueda..."
rake sunspot:solr:start
sleep 5
rake sunspot:reindex
echo "Arrancando el servidor..."
rails server

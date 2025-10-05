#!/bin/bash

# Ruta correcta del directorio (ajústala si cambia el nombre exacto)
dir=$HOME/workspaces/dawncraft-server 

while true; do
  echo "Autosubida: $(date '+%Y-%m-%d %H:%M:%S')"

  if [ -d "$dir" ]; then
    cd "$dir" || { echo "No se encontró el directorio"; sleep 900; continue; }
  else
    echo "El directorio $dir no existe."
    sleep 900
    continue
  fi

  # Agrega solo archivos sueltos (sin carpetas)
  git add -Adir=$HOME/workspaces/dawncraft-server

  if ! git diff --cached --quiet; then
    git commit -m "Autosubida de archivos sueltos $(date '+%Y-%m-%d %H:%M:%S')"
    git push origin main
    echo "Archivos subidos correctamente."
  else
    echo "No hay cambios nuevos. Nada que subir."
  fi

  sleep 900  # Espera 15 minutos
done

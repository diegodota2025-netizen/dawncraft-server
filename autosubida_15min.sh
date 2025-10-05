#!/bin/bash

# Ruta del directorio del servidor DawnCraft
dir="$HOME/workspaces/dawncraft-server"

# VERIFICACIÓN INICIAL DE REALIDAD
echo "🔍 Escaneando integridad dimensional..."
if [ -d "$dir" ]; then
    cd "$dir" || exit 1
    
    # ¿EXISTE EL UNIVERSO GIT?
    if [ ! -d ".git" ]; then
        echo "🚨 ALERTA: No hay repositorio Git en esta realidad"
        echo "💫 Inicializando nueva línea temporal Git..."
        git init
        git config user.name "DawnCraft Server"
        git config user.email "server@dawncraft.com"
        git add .
        git commit -m "Creación inicial del universo DawnCraft"
        echo "✅ Realidad Git estabilizada"
    fi
else
    echo "❌ Ruptura dimensional: Directorio $dir no existe"
    exit 1
fi

# BUCLE PRINCIPAL
while true; do
    echo "🕐 Autosubida: $(date '+%Y-%m-%d %H:%M:%S')"
    
    cd "$dir" || {
        echo "⚠️  Anomalía dimensional: Directorio desapareció"
        sleep 900
        continue
    }
    
    # AGREGAR CAMBIOS
    git add .
    
    # VERIFICAR CAMBIOS REALES
    if ! git diff --cached --quiet; then
        git commit -m "Auto-commit: $(date '+%Y-%m-%d %H:%M:%S')"
        
        # ¿TIENES REMOTE CONFIGURADO?
        if git remote | grep -q "origin"; then
            git push origin main
            echo "✅ Realidad sincronizada correctamente"
        else
            echo "⚠️  Cambios guardados localmente (sin remote configurado)"
        fi
    else
        echo "🔵 Dimensión estable - Sin cambios detectados"
    fi
    
    sleep 900  # 15 minutos de estabilización temporal
done
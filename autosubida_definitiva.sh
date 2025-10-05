#!/bin/bash
dir="$HOME/dawncraft-server"
LOCK_FILE="/tmp/autosubida.lock"

# Evitar múltiples instancias
if [ -f "$LOCK_FILE" ]; then
    echo "⏸️  Ya hay una instancia ejecutándose"
    exit 1
fi
touch "$LOCK_FILE"

while true; do
    echo "🔄 Autosubida: $(date '+%Y-%m-%d %H:%M:%S')"
    
    if [ -d "$dir" ]; then
        cd "$dir" || { echo "❌ Error al acceder al directorio"; sleep 900; continue; }
        
        git add .
        if ! git diff --cached --quiet; then
            git commit -m "Auto-commit: $(date '+%Y-%m-%d %H:%M:%S')"
            git push origin main
            echo "✅ Archivos subidos correctamente."
        else
            echo "🔵 Sin cambios nuevos."
        fi
    else
        echo "❌ Directorio $dir no existe."
    fi
    
    sleep 900  # 15 minutos
done

rm "$LOCK_FILE"

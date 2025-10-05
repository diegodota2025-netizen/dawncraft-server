#!/bin/bash
cd ~/workspaces/dawncraft-server
git add .
git diff --cached --quiet || git commit -m "Backup automático $(date '+%Y-%m-%d %H:%M:%S')"
git push origin main
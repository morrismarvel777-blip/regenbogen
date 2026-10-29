#!/bin/bash

# In den Repository-Ordner wechseln
cd "$(dirname "$0")" || exit 1

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "❌ Kein Git-Repository gefunden!"
    exit 1
fi

if [ "$(git branch --show-current)" != "main" ]; then
    echo "❌ Bitte zuerst auf den Branch main wechseln."
    exit 1
fi

# Bei einem bereits laufenden Merge oder Rebase stoppen
if [ -d "$(git rev-parse --git-path rebase-merge)" ] ||
   [ -d "$(git rev-parse --git-path rebase-apply)" ] ||
   [ -f "$(git rev-parse --git-path MERGE_HEAD)" ]; then
    echo "❌ Es läuft bereits ein Merge oder Rebase. Zuerst abschliessen."
    exit 1
fi

trap 'echo; echo "🛑 Auto-Git gestoppt."; exit 0' INT TERM

echo "✅ Auto-Git gestartet!"
echo "📁 Repository: $(pwd)"
echo "🔄 Synchronisierung alle 60 Sekunden"
echo "Zum Stoppen: Ctrl + C"

while true; do
    # Alle lokalen Änderungen zum Commit hinzufügen
    if ! git add -A; then
        echo "❌ Dateien konnten nicht hinzugefügt werden."
        exit 1
    fi

    # Nur bei Änderungen einen Commit erstellen
    if ! git diff --cached --quiet; then
        if ! git commit -m "Auto-Save $(date '+%d.%m.%Y %H:%M:%S')"; then
            echo "❌ Commit fehlgeschlagen. Auto-Git gestoppt."
            exit 1
        fi
        echo "✅ Lokale Änderungen gespeichert."
    else
        echo "ℹ️ Keine neuen lokalen Änderungen."
    fi

    # Änderungen von GitHub holen und lokale Commits darauf aufbauen
    if ! git pull --rebase --autostash origin main; then
        echo "❌ Synchronisierung fehlgeschlagen."
        echo "Bei Konflikten: git status ausführen und Konflikte lösen."
        echo "Auto-Git wurde gestoppt."
        exit 1
    fi

    # Erst nach erfolgreicher Synchronisierung pushen
    if git push origin main; then
        echo "✅ GitHub synchronisiert!"
    else
        echo "❌ Push fehlgeschlagen. Neuer Versuch in 60 Sekunden."
    fi

    sleep 60
done

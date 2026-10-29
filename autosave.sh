
#!/bin/bash

# Zum Repository wechseln
cd "$(dirname "$0")" || exit 1

# Prüfen, ob Git vorhanden ist
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "❌ Kein Git-Repository gefunden!"
    exit 1
fi

echo "✅ Auto-Git gestartet!"
echo "📁 Repository: $(pwd)"
echo "🔄 Prüfung alle 60 Sekunden"
echo "Zum Stoppen: Ctrl + C"

while true; do

    # Änderungen erkennen und hinzufügen
    if git add -A; then

        if ! git diff --cached --quiet; then

            # Automatischer Commit
            if git commit -m "Auto-Save $(date '+%d.%m.%Y %H:%M:%S')"; then
                echo "✅ Neuer Commit erstellt!"
            else
                echo "❌ Commit fehlgeschlagen!"
            fi

        else
            echo "ℹ️ Keine neuen Änderungen."
        fi

    else
        echo "❌ Dateien konnten nicht hinzugefügt werden!"
    fi

    # Änderungen auf GitHub hochladen
    if git push; then
        echo "✅ GitHub synchronisiert!"
    else
        echo "❌ Push fehlgeschlagen! GitHub-Zugriff prüfen."
    fi

    # 60 Sekunden warten
    sleep 60

done

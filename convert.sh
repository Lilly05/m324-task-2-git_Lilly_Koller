#!/bin/bash

# Dateien definieren
INPUT_FILE="README.md"
OUTPUT_FILE="index.html"

# Überprüfen, ob README.md existiert
if [ ! -f "$INPUT_FILE" ]; then
    echo "Die Datei $INPUT_FILE existiert nicht. Bitte füge sie hinzu."
    exit 1
fi

# Funktion zur Konvertierung
convert_to_html() {
    echo "Konvertiere $INPUT_FILE nach $OUTPUT_FILE..."
    
    # Nutze pandoc, um Markdown in HTML zu konvertieren
    pandoc "$INPUT_FILE" -o "$OUTPUT_FILE" --standalone
    
    # Alternativ: markdown-cli (falls installiert)
    # markdown "$INPUT_FILE" > "$OUTPUT_FILE"
    
    echo "Konvertierung abgeschlossen. $OUTPUT_FILE wurde erstellt."
}

# Überprüfung, ob eine Aktualisierung notwendig ist
#!/bin/bash

# Überprüfen, ob README.md neuer ist als index.html
if [ README.md -nt index.html ]; then
    echo "README.md wurde geändert, konvertiere in index.html"
    convert_to_html
else
    echo "index.html ist bereits aktuell."
fi

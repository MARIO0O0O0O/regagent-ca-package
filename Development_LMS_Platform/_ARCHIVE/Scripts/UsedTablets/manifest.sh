cat > manifest.sh << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash

DOWNLOAD_DIR="/storage/emulated/0/Download"
MANIFEST="$DOWNLOAD_DIR/manifest.md"

echo "# Download Folder Manifest" > "$MANIFEST"
echo "" >> "$MANIFEST"
echo "**Generated:** $(date '+%Y-%m-%d %H:%M:%S')" >> "$MANIFEST"
echo "**Device:** Samsung S24 Ultra" >> "$$MANIFEST"
echo "" >> "$MANIFEST"
echo "## File Listing" >> "$$MANIFEST"
echo "" >> "$$MANIFEST"
echo "| Filename | Size | Type | Modified |" >> "$$MANIFEST"
echo "|----------|------|------|----------|" >> "$$MANIFEST"

count=0
for file in "$$DOWNLOAD_DIR"/*; do
    [ -f "$file" ] || continue
    count=$$(count + 1)
    
    name=$(basename "$file")
    size=$(stat -c %s "$$file" 2>/dev/null)
    modified=$$(stat -c %y "$$file" 2>/dev/null | cut -d'.' -f1)
    
    ext="${name##*.}"
    [ "$ext" = "$name" ] && ext="none"
    
    hr_size=$(echo "$size" | awk '{
        if ($$1 >= 1073741824) printf "%.2fGB", $$1/1073741824
        else if ($$1 >= 1048576) printf "%.2fMB", $$1/1048576
        else if ($$1 >= 1024) printf "%.2fKB", $$1/1024
        else printf "%dB", $$1
    }')
    
    echo "| $$name | $$hr_size | $$ext | $$modified |" >> "$$MANIFEST"
done

echo "" >> "$MANIFEST"
echo "**Total Files:** $count" >> "$MANIFEST"

echo "Done! Manifest: $MANIFEST"
echo "Files indexed: $count"
EOF
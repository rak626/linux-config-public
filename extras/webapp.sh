#!/usr/bin/env bash

set -e

APP_NAME="$1"
URL="$2"

if [[ -z "$APP_NAME" || -z "$URL" ]]; then
  echo "Usage: webapp <name> <url>"
  exit 1
fi

# -------------------------
# Normalize names
# -------------------------
APP_ID=$(echo "$APP_NAME" | tr -d ' ')
ICON_ID=$(echo "$APP_NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')

ICON_DIR="$HOME/.local/share/icons/hicolor/512x512/apps"
DESKTOP_DIR="$HOME/.local/share/applications"

ICON_PATH="$ICON_DIR/$ICON_ID.png"
DESKTOP_FILE="$DESKTOP_DIR/$ICON_ID.desktop"

mkdir -p "$ICON_DIR" "$DESKTOP_DIR"

# -------------------------
# Remove old files
# -------------------------
echo "♻️ Cleaning previous files..."
rm -f "$DESKTOP_FILE"
rm -f "$ICON_PATH"

# -------------------------
# Fetch icon (multi-source)
# -------------------------
echo "🔍 Fetching icon..."

DOMAIN=$(echo "$URL" | awk -F/ '{print $3}')
TMP_ICON="/tmp/$ICON_ID.ico"

# 1️⃣ Try Google (high-res)
if curl -L --fail -s \
  "https://www.google.com/s2/favicons?sz=512&domain=$DOMAIN" \
  -o "$ICON_PATH"; then

  SIZE=$(stat -c%s "$ICON_PATH")

  if [[ $SIZE -gt 1000 ]]; then
    echo "✅ Using Google favicon"
  else
    echo "⚠️ Google icon too small, trying DuckDuckGo"
    rm -f "$ICON_PATH"
  fi
fi

# 2️⃣ DuckDuckGo fallback
if [[ ! -s "$ICON_PATH" ]]; then
  if curl -L --fail -s \
    "https://icons.duckduckgo.com/ip3/$DOMAIN.ico" \
    -o "$TMP_ICON"; then

    echo "✅ Using DuckDuckGo icon"
    magick "$TMP_ICON" -resize 512x512 "$ICON_PATH"
  fi
fi

# -------------------------
# Final fallback
# -------------------------
if [[ ! -s "$ICON_PATH" ]]; then
  echo "⚠️ No icon found, generating fallback"

  magick -size 512x512 xc:"#3b4252" \
    -gravity center -pointsize 120 -fill white \
    -annotate 0 "${APP_NAME:0:1}" \
    "$ICON_PATH"
fi

# -------------------------
# Normalize final icon
# -------------------------
magick "$ICON_PATH" -resize 512x512 "$ICON_PATH"

# -------------------------
# Create .desktop file
# -------------------------
echo "📝 Creating desktop entry..."

cat > "$DESKTOP_FILE" <<EOF
[Desktop Entry]
Version=1.0
Name=$APP_NAME
Exec=chromium-browser --class=$APP_ID --app=$URL --kiosk
Icon=$ICON_ID
Type=Application
Categories=Network;
StartupNotify=true
StartupWMClass=$APP_ID
Terminal=false
EOF

chmod +x "$DESKTOP_FILE"

# -------------------------
# Update system
# -------------------------
update-desktop-database "$DESKTOP_DIR" >/dev/null 2>&1 || true
gtk-update-icon-cache "$HOME/.local/share/icons/hicolor" >/dev/null 2>&1 || true

echo "🚀 App created successfully: $APP_NAME"


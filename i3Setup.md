WM: i3 
Bar: polybar 
Compositor: picom 
Launcher: rofi 
Terminal: alacritty 
Audio: pipewire + pavucontrol + pamixer 
Bluetooth: blueman 
Network: NetworkManager + nm-applet 
Notifications: dunst 
Lockscreen: i3lock-color 
Screenshot: flameshot 
System: 
	- lxqt-policykit
	- xfce4-power-manager
	- udiskie 
	
1. XDG + Desktop Integration (CRITICAL)
sudo dnf install xdg-user-dirs xdg-utils xdg-desktop-portal xdg-desktop-portal-gtk
xdg-user-dirs-update

2. Dbus session (if not stable)
echo $DBUS_SESSION_BUS_ADDRESS
exec --no-startup-id dbus-update-activation-environment --systemd DISPLAY XAUTHORITY 

3. file manager
sudo dnf install thunar thunar-archive-plugin thunar-volman

4. disk mount
sudo dnf install gvfs gvfs-mtp gvfs-smb


# 🧱 Fedora i3 Setup (Production-Ready Minimal Stack)

This is a **clean, copy-paste-ready installation guide** for a stable and minimal i3-based environment on Fedora.

---

## 🖥️ 1. Core Stack (WM + UI)

```bash
sudo dnf install -y \
  i3 polybar picom rofi alacritty \
  dunst i3lock xss-lock flameshot
```

---

## 🔊 2. Audio (PipeWire Full Stack)

```bash
sudo dnf install -y \
  pipewire pipewire-pulseaudio wireplumber \
  pavucontrol pamixer helvum
```

---

## 📶 3. Network + Bluetooth

```bash
sudo dnf install -y \
  NetworkManager NetworkManager-tui nm-connection-editor \
  bluez bluez-tools blueman
```

Enable services:

```bash
sudo systemctl enable --now NetworkManager bluetooth
```

---

## 🔐 4. System Utilities (Critical)

```bash
sudo dnf install -y \
  lxqt-policykit xfce4-power-manager udiskie \
  xdg-user-dirs xdg-utils xdg-desktop-portal xdg-desktop-portal-gtk
```

Initialize:

```bash
xdg-user-dirs-update
```

---

## 🧠 5. DBus Fix (if needed)

Add to i3 config (`~/.config/i3/config`):

```bash
exec --no-startup-id dbus-update-activation-environment --systemd DISPLAY XAUTHORITY
```

Check:

```bash
echo $DBUS_SESSION_BUS_ADDRESS
```

---

## 📁 6. File Manager + Archive

```bash
sudo dnf install -y \
  thunar thunar-archive-plugin thunar-volman \
  file-roller unzip p7zip p7zip-plugins
```

---

## 🔌 7. Disk / USB / MTP Support

```bash
sudo dnf install -y \
  gvfs gvfs-mtp gvfs-smb
```

---

## 🔤 8. Fonts (Important)

```bash
sudo dnf install -y \
  google-noto-fonts google-noto-emoji-fonts \
  fontawesome-fonts jetbrains-mono-fonts
```

---

## 🎨 9. Themes + Icons

```bash
sudo dnf install -y \
  lxappearance arc-theme papirus-icon-theme
```

---

## 🧰 10. Essential CLI Tools

```bash
sudo dnf install -y \
  git curl wget htop btop \
  ripgrep fd fzf zoxide neovim
```

---

## 🖥️ 11. Display / Multi-Monitor

```bash
sudo dnf install -y \
  xrandr arandr autorandr
```

---

## 🔋 12. Laptop Power Optimization (Optional)

```bash
sudo dnf install -y tlp tlp-rdw
sudo systemctl enable tlp
```

---

## 📋 13. Clipboard Manager

```bash
sudo dnf install -y copyq
```

---

## 🎥 14. Media + Codecs

```bash
sudo dnf install -y vlc ffmpeg
```

---

## ⚙️ 15. Autostart (i3 Config)

Add to `~/.config/i3/config`:

```bash
# Core services
exec --no-startup-id nm-applet
exec --no-startup-id blueman-applet
exec --no-startup-id dunst
exec --no-startup-id xfce4-power-manager
exec --no-startup-id lxqt-policykit-agent
exec --no-startup-id udiskie

# Lock on idle
exec --no-startup-id xss-lock -- i3lock
```

---

## ✅ Final Outcome

* Fully functional i3 environment
* Stable XDG + DBus integration
* Working audio, Bluetooth, network
* File manager + USB + MTP support
* Clean UI (fonts, icons, themes)
* Developer-ready CLI tooling

---


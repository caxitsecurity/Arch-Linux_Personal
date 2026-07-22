cat > ~/restore-arch.sh << 'EOF'
#!/bin/bash
# ================================================
# Restauración Automática - Arch Linux Personal
# Repo: https://github.com/caxitsecurity/Arch-Linux_Personal
# ================================================

set -e

echo "=== Iniciando restauración de tu entorno Arch ==="

# Actualizar sistema
sudo pacman -Syu --noconfirm

# Instalar git si no está
command -v git >/dev/null 2>&1 || sudo pacman -S --noconfirm git

# Clonar / actualizar repo
REPO_DIR="$HOME/Arch-Linux_Personal"
if [ -d "$REPO_DIR" ]; then
    echo "Actualizando repositorio..."
    cd "$REPO_DIR" && git pull
else
    echo "Clonando repositorio..."
    git clone https://github.com/caxitsecurity/Arch-Linux_Personal.git "$REPO_DIR"
    cd "$REPO_DIR"
fi

# Instalar paquetes oficiales
echo "Instalando paquetes de pacman..."
if [ -f "paquetes/arch-packages.txt" ]; then
    sudo pacman -S --needed --noconfirm - < paquetes/arch-packages.txt
else
    echo "⚠️ Lista de paquetes no encontrada"
fi

# Instalar yay (AUR helper)
if ! command -v yay &> /dev/null; then
    echo "Instalando yay..."
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd "$REPO_DIR"
fi

# Crear directorios de configuración
mkdir -p ~/.config/i3 ~/.config/polybar ~/.config/alacritty ~/.config

# Copiar configuraciones
echo "Copiando archivos de configuración..."
cp "$REPO_DIR/i3/config" ~/.config/i3/config
cp "$REPO_DIR/polybarr/config.ini" ~/.config/polybar/config.ini
cp "$REPO_DIR/Terminal !!/alacritty.toml" ~/.config/alacritty/alacritty.toml
cp "$REPO_DIR/Terminal !!/.zshrc" ~/.zshrc
cp "$REPO_DIR/Terminal !!/starship.toml" ~/.config/starship.toml

# Screen layout
cp "$REPO_DIR/screenlayout.sh" ~/.config/
chmod +x ~/.config/screenlayout.sh

# Cambiar shell a Zsh
if ! grep -q "$(which zsh)" /etc/shells 2>/dev/null; then
    which zsh | sudo tee -a /etc/shells
fi
chsh -s "$(which zsh)" "$USER"

echo "=== Restauración principal terminada! ==="
echo ""
echo "Pasos finales manuales:"
echo "1. Copia tu wallpaper: ~/Images/Wallpapers/f15.jpg"
echo "2. Ejecuta el layout de monitores: ~/.config/screenlayout.sh"
echo "3. Reinicia sesión o haz reboot"
echo "4. Si faltan paquetes AUR, ejecútalos con yay"
echo ""
echo "¡Listo para usar tu entorno i3 personalizado!"
EOF

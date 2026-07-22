# Arch Linux Personal

Repositorio personal de configuración para mi entorno **Arch Linux.**
> Este repo es para respaldar y restaurar mi entorno gráfico personal.

## Setup principal

| Área | Configuración |
|---|---|
| Sistema | Arch Linux |
| Window Manager | i3 la llea |
| Barra | Polybar |
| Compositor | Picom (Lo quité por rendimiento) |
| Terminal | Alacritty |
| Shell | Zsh |
| Lanzador | Rofi con dmenu |
| Tema visual | Dracula Purple |
| Fuente | JetBrainsMono Nerd Font |

## Monitores

Configuración personal usada en i3/xrandr:

| Monitor | Posición | Resolución | Frecuencia |
|---|---:|---:|---:|
| Principal | Derecha | 1920x1080 | 200Hz |
| Secundario | Izquierda | 1366x768 | 60Hz |

> En mi Arch actual el monitor principal suele ser `DP-1`. El secundario puede aparecer como `DVI-I-1` o `DVI-D-1`, así que antes de aplicar scripts de pantalla conviene revisar con `xrandr`.

## Estructura del repo

```text
.
├── config/
│   ├── i3/
│   ├── polybar/
│   ├── rofi/
│   ├── alacritty/
│   ├── fastfetch/
│   └── starship.toml
├── home/
│   ├── .zshrc
│   ├── .xinitrc
│   ├── .Xresources
│   └── .screenlayout/
├── scripts/
│   ├── backup-dotfiles.sh
│   ├── install-dotfiles.sh
│   └── arch-packages.txt
└── README.md
```

## Respaldar mi configuración actual

Desde mi Arch Linux:

```bash
git clone https://github.com/caxitsecurity/Arch-Linux_Personal.git
cd ArchPersonal-Ligero-PCPotato-I3-Polybar-Picom.-
chmod +x scripts/backup-dotfiles.sh
./scripts/backup-dotfiles.sh

git status
git add .
git commit -m "sync: actualizar dotfiles Arch i3"
git push
```

## Restaurar en una instalación nueva

```bash
git clone https://github.com/caxitsecurity/Arch-Linux_Personal.git
cd ArchPersonal-Ligero-PCPotato-I3-Polybar-Picom.-
chmod +x scripts/install-dotfiles.sh
./scripts/install-dotfiles.sh
```

Después reiniciar i3:

```bash
Mod+Shift+R
```

O reboot y volver a entrar.

## Instalar paquetes base

```bash
sudo pacman -S --needed - < scripts/arch-packages.txt
```

Si algún paquete cambia de nombre o no existe en los repos oficiales, instalarlo manualmente o buscarlo en AUR con `yay`.

## Seguridad antes de subir cambios

Antes de hacer `git add .`, revisar siempre:

```bash
git status
git diff --cached
```


## Notas personales

Este setup representa mi entorno de trabajo para Linux, Programación y ciberseguridad. La idea es Levantar mi Arch sin perder tiempo configurando todo desde cero DENUEVO.

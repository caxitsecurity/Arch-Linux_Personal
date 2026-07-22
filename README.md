# Arch Linux Personal

Repositorio personal con la configuración y documentación de mi entorno de trabajo en **Arch Linux**.

El objetivo de este proyecto es mantener un respaldo organizado de mi configuración para poder reconstruir mi sistema rápidamente después de una instalación limpia, además de documentar cada componente para comprender cómo funciona y facilitar futuras modificaciones.

---

# Especificaciones del sistema

| Componente | Configuración |
|------------|---------------|
| Distribución | Arch Linux |
| Window Manager | i3 |
| Barra | Polybar |
| Compositor | Picom *(eliminado por rendimiento)* |
| Terminal | Alacritty |
| Shell | Zsh |
| Prompt | Starship |
| Lanzador | Rofi (modo dmenu) |
| Tema | Dracula Purple |
| Fuente | JetBrainsMono Nerd Font |

---

# Monitores

Configuración utilizada habitualmente.

| Monitor | Posición | Resolución | Frecuencia |
|----------|----------|------------|------------|
| Principal | Derecha | 1920×1080 | 200 Hz |
| Secundario | Izquierda | 1366×768 | 60 Hz |

Antes de ejecutar cualquier configuración relacionada con monitores, verificar los nombres de las salidas de vídeo:

```bash
xrandr
```

En mi equipo normalmente corresponden a:

- Principal: `DP-1`
- Secundario: `DVI-I-1` o `DVI-D-1`

---

# Estructura del repositorio

```text
.
├── README.md
├── SECURITY.md
├── i3/
│   └── config
├── polybar/
│   └── config.ini
├── terminal/
│   ├── README.md
│   ├── .zshrc
│   ├── starship.toml
│   └── alacritty.toml
├── paquetes/
│   └── arch-packages.txt
└── screenlayout.sh
```

---

# Restaurar paquetes

Instalar todos los paquetes registrados:

```bash
sudo pacman -S --needed - < packages/arch-packages.txt
```

Si algún paquete ya no existe en los repositorios oficiales, instalarlo manualmente o buscarlo en AUR.

---

# Componentes

## Terminal

Contiene toda la configuración relacionada con el entorno de terminal.

- Zsh
- Starship
- Alacritty

---

## i3

Configuración completa del gestor de ventanas i3.

---

## Polybar

Configuración personalizada de la barra de estado.

---

## Screen Layout

`screenlayout.sh` contiene la configuración de los monitores mediante `xrandr`.

Puede ejecutarse con:

```bash
chmod +x screenlayout.sh
./screenlayout.sh
```

---

# Actualizar la lista de paquetes

Guardar todos los paquetes instalados explícitamente:

```bash
pacman -Qqe > packages/arch-packages.txt
```

---

# Seguridad

Antes de subir cambios al repositorio, revisar siempre:

```bash
git status
git diff
```

Evitar subir:

- claves SSH
- credenciales
- tokens
- archivos personales
- historiales del navegador
- archivos temporales

---

# Objetivo

Este repositorio documenta mi entorno de trabajo en Arch Linux.

Más que almacenar archivos de configuración, busca servir como referencia para comprender cada componente del sistema y poder reconstruir el entorno completo de forma rápida, limpia y reproducible.

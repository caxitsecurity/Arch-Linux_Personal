## main.sh de mi config personal de monitores secundario a la izq, prinicpal derecha, con 200hz etc.
#!/bin/bash

xrandr --output DVI-I-1 --mode 1366x768 --rate 59.79 --pos 0x0 \
       --output DisplayPort-0 --primary --mode 1920x1080 --rate 200.00 --pos 1366x0

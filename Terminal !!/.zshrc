## copia y pegas en el nano yerri
autoload -U colors && colors

PROMPT='%F{green}%n%f@%F{blue}%m%f:%F{cyan}%~%f %# '
# Reemplazar ls por lsd
alias ls='lsd'
alias ll='lsd -l'
alias la='lsd -la'
alias lt='lsd --tree'
eval "$(starship init zsh)"

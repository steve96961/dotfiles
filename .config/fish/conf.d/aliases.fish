alias ll='ls -lah'
alias fetch='fastfetch'
alias pkglist="pacman -Qi|grep -E '^(Name|Installed)'|cut -f2 -d':'|paste - -|column -t|sort -nrk 2|grep MiB|less"

alias ll='ls -lah'
#alias fetch='pokeget pikachu --hide-name | fastfetch --file-raw -'
alias fetch='fastfetch'
alias pkglist="pacman -Qi|grep -E '^(Name|Installed)'|cut -f2 -d':'|paste - -|column -t|sort -nrk 2|grep MiB|less"

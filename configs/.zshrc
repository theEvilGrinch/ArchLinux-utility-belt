# $HOME/.zshrc
export ZSH="$HOME/.oh-my-zsh"


# Oh my zsh
ZSH_THEME="jonathan"
#plugins=(git sudo web-search golang)
plugins=(git sudo golang)
source $ZSH/oh-my-zsh.sh

set -a
source $HOME/.env
source $HOME/.env_priv
set +a

source /usr/share/nvm/init-nvm.sh

path+=(
    $HOME/.local/bin
    $HOME/go/bin
    $JAVA_HOME/bin
    /usr/bin
)

fpath+=($HOME/.zfunc)

typeset -U path

export PATH

for file in $HOME/.zfunc/*; do
  autoload -Uz ${file:t}
done

zstyle ':completion:*' file-sort name
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/sbin /sbin $path
zstyle ':completion:*' file-patterns '%p:globbed-files *(-/):directories'
zstyle ':completion:*' rehash true

# System
alias zconf="mcedit ~/.zshrc"
alias clear_swap="sudo swapoff -a && sudo swapon -a"
alias update_os='echo "\nUpdate mirrorlist\n" && update_mirrorlist && echo "\nUpdate official repo\n" && sudo pacman -Syyu && echo "\nUpdate AUR\n" && yay -Syyu'
alias update_os_force='update_mirrorlist && sudo pacman -Syyu --noconfirm && yay -Syyu --noconfirm'
alias update_os_and_reboot='sudo pacman -Syyu && yay -Syyu && sudo reboot'
alias update_os_and_poweroff='sudo pacman -Syu && yay -Syu && sudo systemctl poweroff'
alias update_mirrorlist='sudo reflector --country Russia,Germany,Netherlands --score 20 --sort rate --save /etc/pacman.d/mirrorlist'
alias update_fonts="sudo fc-cache -fv && fc-cache -f -v"
alias off="sudo shutdown --no-wall"
alias rb="sudo systemctl reboot"
alias allow_localhost3000="sudo ufw allow from 192.168.1.0/24 to any port 3000"
alias disallow_localhost3000="sudo ufw delete allow from 192.168.1.0/24 to any port 3000"

# PKG's
alias pmr='sudo pacman -Rns'
alias pm_check_orphans="pacman -Qdtq"
alias pm_clear_orphans="sudo pacman -Rns $(pacman -Qdtq)"
alias pm_clear_cache='sudo paccache -rk1 && sudo paccache -ruk0 && yay -Scc --noconfirm'
alias pms='sudo pacman -S'
alias pmss='sudo pacman -Ss'
alias rmdb='sudo rm /var/lib/pacman/db.lck'
alias ys="yay -S"
alias yss="yay -Ss"
alias yr="yay -Rns"

# Docker
alias dc="docker"
alias dcr="docker run"
alias dcri="docker run -it"
alias dclog="echo "$DOCKER_HUB_TOKEN" | docker login -u theevilgrinch --password-stdin"

# NPM
alias nig="npm install -g"
alias nug="npm uninstall -g"
alias nisd="npm install --save-dev"
alias nusd="npm uninstall --save-dev"
alias clear_npm_cache="npm cache verify --force && npm cache clean --force"
alias nu="npm update"

# Other
alias netTest="echo '\nPing google.com:\n' && ping -c 5 google.com && echo '\n-----\n\nTraceroute google.com:\n' && traceroute google.com && echo '\n-----\n\nSpeed test Selectel (Saint Petersburg, Russia) [167.91 km]:' && speedtest -s 16125"
alias sdd_free="df -h /dev/sda2"
alias ir="input-remapper-control --command stop-all && input-remapper-control --command autoload"
alias ir_stop="input-remapper-control --command stop-all"
alias m="mc"
alias sm="sudo mc"
alias se="sudo mcedit"
alias e="mcedit"
alias b="btop"
alias td="mktemp -d -p ."
alias tf="mktemp -p ."
alias tg="tar -czvf"
alias utg="tar -xzvf"

# $HOME/.zshrc

export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8
export EDITOR=mcedit
export GPG_TTY=$(tty)
export NVM_DIR="$HOME/.nvm"
export JAVA_HOME=$(readlink -f /usr/lib/jvm/default)
export GOPATH="$HOME/go"

# =====
path=(
    /usr/bin
    /usr/local/bin
    /usr/local/sbin
    /usr/sbin
    /sbin
    $HOME/.local/bin
    $HOME/.npm-global/bin
    $HOME/go/bin
    $JAVA_HOME/bin
    $HOME/.nvm/versions/node/v23.6.0/bin
    /usr/bin/site_perl
    /usr/bin/vendor_perl
    /usr/bin/core_perl
    /usr/lib/node_modules
    ${path}
)

fpath+=($HOME/.zfunc)

typeset -U path
export PATH

# =====
autoload -Uz compinit
autoload -Uz $HOME/.zfunc/*

compinit -i

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/sbin /sbin $path

# ===== OH-MY-ZSH =====
ZSH_THEME="jonathan"
plugins=(git sudo web-search)
source $ZSH/oh-my-zsh.sh

# Sysytem
alias zconf="mcedit ~/.zshrc"
alias clear_pm_cache="sudo paccache -rk1 && sudo paccache -ruk0 && yay -Scc --noconfirm"
alias clear_swap="sudo swapoff -a && sudo swapon -a"
alias delete_orphans_package='sudo pacman -Rsn $(sudo pacman -Qdtq)'
alias update_os='echo "\nUpdate mirrorlist\n" && update_mirrorlist && echo "\nUpdate official repo\n" && sudo pacman -Syyu && echo "\nUpdate AUR\n" && yay -Syyu'
alias update_os_fast_and_force='update_mirrorlist && sudo pacman -Syyu --noconfirm && yay -Syyu --noconfirm'
alias update_os_and_reboot='sudo pacman -Syyu --noconfirm && yay -Syyu --noconfirm && sudo reboot'
alias update_os_and_poweroff='sudo pacman -Syu --noconfirm && yay -Syu --noconfirm && sudo systemctl poweroff'
alias update_mirrorlist='sudo reflector --country Russia,Germany,Netherlands --score 20 --sort rate --save /etc/pacman.d/mirrorlist'
alias update_fonts="sudo fc-cache -fv && fc-cache -f -v"
alias off="sudo shutdown --no-wall"

# PKG's
alias pmr='sudo pacman -R'
alias pms='sudo pacman -S'
alias pmss='sudo pacman -Ss'
alias rmdb='sudo rm /var/lib/pacman/db.lck'
alias ys="yay -S"
alias yss="yay -Ss"
alias yr="yay -R"

# Other
alias netTest="echo '\nPing google.com:\n' && ping -c 5 google.com && echo '\n-----\n\nTraceroute google.com:\n' && traceroute google.com && echo '\n-----\n\nSpeed test Selectel (Saint Petersburg, Russia) [167.91 km]:' && speedtest -s 16125"
alias vpn="sudo openvpn $HOME/soft/vpn/Korea_119.194.199.103_udp.ovpn"
alias free_sdd="df -h /dev/sda2"
alias ir="input-remapper-control --command stop-all && input-remapper-control --command autoload"
alias ir_stop="input-remapper-control --command stop-all"
alias m="mc"
alias sm="sudo mc"
alias se="sudo mcedit"
alias lc="cd ~/web/projects/learn-code.ru"
alias as="cd ~/web/projects/allegrostyle.ru"
alias b="btop"

# NPM
alias nig="npm install -g"
alias nug="npm uninstall -g"
alias nisd="npm install --save-dev"
alias nusd="npm uninstall --save-dev"
alias clear_npm_cache="npm cache verify --force && npm cache clean --force"
alias nu="npm update"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
unsetopt nomatch
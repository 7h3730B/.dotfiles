# firefox
export BROWSER='firefox'

# nvim
export EDITOR='nvim'

# Localization
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Alacritty
export TERMINAL=alacritty
export TERM="xterm-256color"

# GPG
export GPG_TTY=$(tty)

# Colorize man pages.
export PAGER=less
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export LESSHISTFILE=-
. "$HOME/.cargo/env"

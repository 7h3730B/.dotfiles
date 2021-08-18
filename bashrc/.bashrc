#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias startx="startx -- vt1 -keeptty > ~/.xorg.log 2>&1"
alias brave='brave --use-gl=desktop --enable-features=VaapiVideoDecoder'
PS1='[\u@\h \W]\$ '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
. "$HOME/.cargo/env"

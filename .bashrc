#
# ~/.bashrc
#

# If not running interactively, don't do anything
if [ -f /usr/lib/python3.4/site-packages/powerline/bindings/bash/powerline.sh ]; then
        tmux source /usr/lib/python3.4/site-packages/powerline/bindings/bash/powerline.sh
        fi

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export wiki_browser="/usr/bin/google-chrome"


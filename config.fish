set -x PYTHONPATH /usr/lib/python3.5/site-packages
set -x EDITOR vim
set -x PATH $PATH /usr/bin /usr/sbin /usr/local/bin  ~/.cabal/bin/ ~/.local/bin/ ~/.gem/ruby/2.3.0/bin
set fish_function_path $fish_function_path "/usr/lib/python3.5/site-packages/powerline/bindings/fish" 
if begin test $TERM = xterm; or test $TERM = xterm-256color; or test $TERM = screen-256color; end
	powerline-daemon -q
    powerline-setup
else
	set -x LANG en_US.utf-8
	set -x LC_ALL en_US.utf-8
end
set fish_greeting ""
alias ls='ls --color=auto'
alias rm='rm -i'
xrdb ~/.Xresources

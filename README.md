# environment (My dotfile config)
## arch linux
### dependency
* ctags
* python
* powerline
* vim
* git
* tmux
* fish
### install
```
$ ./arch_install.sh
```
or step by step
1. Install above dependency
2. For vim, run
```
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
move vimrc to correct location and run
```
$ vim +PluginInstall
```
Edit powerline python path in vimrc

3. For fish, move `config.fish` to correct location, and edit python path and powerline bindings
4. For bash, move `.bashrc` to correct location, and edit python path and powerline bindings
5. For tmux, move `.tmux.conf` to correct location, and edit python path and powerline bindings
6. powerline color scheme, move powerline folder to `.config` or move necessary file to correct location.

## ubuntu
### dependency
* ctags
* python, python-pip
* powerline(use pip)
* vim
* git
* tmux
* fish
### install
step by step
1. Install above dependency, for powerline
```
$ pip install --user powerline-status
$ wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
$ wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
$ mv PowerlineSymbols.otf ~/.fonts/
$ fc-cache -vf ~/.fonts/
$ mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
```
2. For vim, run
```
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
move vimrc to correct location and run
```
$ vim +PluginInstall
```
Edit powerline python path in vimrc

3. For fish, move `config.fish` to correct location, and edit python path and powerline bindings
4. For bash, move `.bashrc` to correct location, and edit python path and powerline bindings
5. For tmux, move `.tmux.conf` to correct location, and edit python path and powerline bindings
6. powerline color scheme, move powerline folder to `.config` or move necessary file to correct location.

## Other config
### conky
#### dependency
* conky-cairo
#### license :MIT
Conky Icons by Carelli.ttf file come from [https://github.com/antoniocarelli/conky](https://github.com/antoniocarelli/conky)
config modifed from same site.

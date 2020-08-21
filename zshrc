# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000000
SAVEHIST=1000000000
unsetopt autocd beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/andrew/.zshrc'
# End of lines added by compinstall

export PATH=/home/andrew/.local/bin:$PATH

# Pure: Pretty, minimal and fast ZSH prompt
autoload -U promptinit && promptinit
prompt pure

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob \!.git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

_fzf_compgen_path() {
  rg --files "$1" | with-dir "$1"
}

# Use rg to generate the list for directory completion
_fzf_compgen_dir() {
  rg --files "$1" | only-dir "$1"
}

export FZF_DEFAULT_OPTS='
  --color=dark
'

export VISUAL=nvim
export EDITOR="$VISUAL"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# asdf
. $HOME/.asdf/asdf.sh
fpath=(${HOME}/.asdf/completions $fpath)
export NODEJS_CHECK_SIGNATURES=no

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# helper functions

# searching rails routes
rr() {
  if [ -n "$1" ]; then
    rails routes | grep "$1"
  else
    rails routes
  fi
}

autoload -Uz compinit
compinit

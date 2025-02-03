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
fpath+=($HOME/.zsh/pure)
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

# asdf
. $HOME/.asdf/asdf.sh
fpath=(${HOME}/.asdf/completions $fpath)
export NODEJS_CHECK_SIGNATURES=no

# prevent webpack sigbarts
export NODE_OPTIONS='--max_old_space_size=16384'

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

# fly.io vars
export FLYCTL_INSTALL="/home/andrew/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# lua
export PATH="$HOME/.luarocks/bin:$PATH"

autoload -Uz compinit
compinit
zmodload -i zsh/complist
setopt hash_list_all            # hash everything before completion
setopt completealiases          # complete aliases
setopt COMPLETE_ALIASES         # complete command line switches
setopt always_to_end            # when completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word         # allow completion from within a word/phrase
setopt correct_all              # spelling correction for commands
setopt list_ambiguous           # complete as much of a completion until it gets ambiguous.
setopt interactivecomments      # bash style interactive comments
CORRECT_IGNORE_FILE='.*'

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

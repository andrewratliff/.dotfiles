# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000000
SAVEHIST=1000000000
unsetopt autocd beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/andrew/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export PATH=/home/andrew/.local/bin:$PATH

# Pure: Pretty, minimal and fast ZSH prompt
autoload -U promptinit && promptinit
prompt pure

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
export NODEJS_CHECK_SIGNATURES=no

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases


export FZF_DEFAULT_COMMAND='ack -f'

# syntax highlighting
source /home/andrew/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

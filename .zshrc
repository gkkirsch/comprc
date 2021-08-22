export ZSH=$HOME/.oh-my-zsh

plugins=(git)

## Scripts ##
# directory listings
alias ls='ls -GF'
# uuid generation
alias uuid="uuidgen | tr \"[:upper:]\" \"[:lower:]\" | tr -d '[:space:]' | pbcopy"
## End Scripts ##

# Enable iex history
export ERL_AFLAGS="-kernel shell_history enabled"

ZSH_TMUX_AUTOSTART=true
ZSH_THEME=robbyrussell
# History
SAVEHIST=10000
HISTFILE=~/.zsh_history

ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh
source ~/.bashrc.d/asdf
source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Add npm to PATH for scripting. Make sure this is the last PATH variable change.
#export PATH="$PATH:$HOME/.asdf/installs/nodejs/9.3.0/.npm/bin"
# Add python pip packages to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/Library/Python/3.7/bin"

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

export ASDF_DIR=~/.asdf
export PATH=$ASDF_DIR/bin:$PATH

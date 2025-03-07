#!/usr/bin/zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Extend path with node and personal bin
export NODE_PATH=$(npm root -g)
export PATH=$HOME/bin:$HOME/.local/bin:$NVM_BIN:$NVM_INC:$NODE_PATH:$PATH

/opt/phpstorm/bin/phpstorm $@

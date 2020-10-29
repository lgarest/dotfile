# History 
export HISTSIZE=50000  # Maximum number of history lines in memory
export HISTFILESIZE=50000  # Maximum number of history lines on disk
export HISTCONTROL=ignoredups:erasedups  # Ignore duplicate lines
shopt -s histappend  # When the shell exits, append to the history file instead of overwriting it
# After each command, append to the history file  and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
# Add ctrlp vim plugin to quick jump between files
set runtimepath^=~/.vim/bundle/ctrlp.vim

# Bash profile modifications
alias bsh='vim ~/dev/dotfile/bash_profile'
alias sbsh='. ~/dev/dotfile/bash_profile'

# Dir navigations
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ll='ls -l'
alias lo='ls -o'
alias la='ls -la'
alias grep='grep --color=auto'
alias tre='tree -L 3'
alias ls='exa'

# Defaults replaced for better commands
alias cat='bat'
alias ping='prettyping --nolegend'
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules --exclude venv"

# Git shorthands
alias gitb='git branch'
alias gitc="git checkout "
alias gitl='git log --graph --decorate'
alias gitlo='git log --graph --decorate --oneline'
alias gitss='clear && echo "on branch:" && git branch && git status'
alias gitrt="git fetch upstream && git rebase upstream/test"
alias gitrm="git fetch upstream && git rebase upstream/master"
alias fetch-prs='git fetch upstream +refs/pull-requests/*:refs/remotes/origin/pr/*'

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



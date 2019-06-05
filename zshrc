# History 
export HISTSIZE=50000  # Maximum number of history lines in memory
export HISTFILESIZE=50000  # Maximum number of history lines on disk
export HISTCONTROL=ignoredups:erasedups  # Ignore duplicate lines
# shopt -s histappend  # When the shell exits, append to the history file instead of overwriting it
# After each command, append to the history file  and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# Dir navigations
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ll='ls -l'
alias lo='ls -o'
alias la='ls -la'
alias tre='tree -L 3'

# Defaults replaced for better commands
alias ls='exa'
alias grep='grep --color=auto'
alias cat='bat'
alias ping='prettyping --nolegend'
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules --exclude venv"

# Git shorthands
alias gitb="git branch"
alias gitc="git checkout "
alias gitl="git log --graph --decorate"
alias gitlo="git log --graph --decorate --oneline"
alias gitss="clear && git branch && git status"
alias gitrt="git fetch upstream && git rebase upstream/test"
alias gitrm="git fetch upstream && git rebase upstream/master"
alias gitrd="git fetch upstream && git rebase upstream/develop"
alias fetch-prs="git fetch upstream +refs/pull-requests/*:refs/remotes/origin/pr/*"
alias vim="nvim"
alias ctags="`brew --prefix`/bin/ctags"

export DEV_DIR="$HOME/dev"

# PowerLevel10k
. $DEV_DIR/powerlevel10k/powerlevel10k.zsh-theme
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh virtualenv dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_PROMPT_ADD_NEWLINE=false

# fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# PATH extensions
export PATH="$HOME/bin:$PATH"

# Pyenv
export PATH="~/.pyenv/versions/3.6.7/bin/:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# NVM
export NVM_DIR="$HOME/.nvm"
# load nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use
# load nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Lazyness
alias venv=". venv/bin/activate"


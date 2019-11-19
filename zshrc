# History 
export HISTSIZE=50000  # Maximum number of history lines in memory
export HISTFILESIZE=50000  # Maximum number of history lines on disk
export HISTCONTROL=ignoredups:erasedups  # Ignore duplicate lines
# shopt -s histappend  # When the shell exits, append to the history file instead of overwriting it
# After each command, append to the history file  and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# Language support
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=UTF-8

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
# Vim
alias vim="nvim"
alias ctags="`brew --prefix`/bin/ctags"

# Git shorthands
alias gitb="git branch"
alias gitc="git checkout "
alias gitl="git log --graph --decorate"
alias gitlo="git log --graph --decorate --oneline"
alias gitss="clear && git branch && git status"
alias gitrt="git fetch upstream && git rebase upstream/test"
alias gitrm="git fetch upstream && git rebase upstream/master"
alias gitrd="git fetch --all --prune && git rebase upstream/develop"
alias fetch-prs="git fetch upstream +refs/pull-requests/*:refs/remotes/origin/pr/*"

# Lazyness
alias venv=". venv/bin/activate"

export SUBLIME_USER_DIR="~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/"
export SUBLIME_BCKP_DIR="~/MEGA/backups/sublime.user.folder/"
alias sublime-backup="cp -R $SUBLIME_USER_DIR $SUBLIME_BCKP_DIR;\
echo Sublime Settings backed up in $SUBLIME_BCKP_DIR"
alias sublime-backup-restore="cp -R $SUBLIME_BCKP_DIR $SUBLIME_USER_DIR;\
echo Sublime Settings restored into $SUBLIME_USER_DIR"

export DEV_DIR="$HOME/dev"

# PowerLevel10k
. $DEV_DIR/powerlevel10k/powerlevel10k.zsh-theme
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh virtualenv dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{014}\u2570%F{cyan}\uF460%F{073}\uF460%F{109}\uF460%f "
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_ETC_ICON=''
POWERLEVEL9K_VCS_GIT_HOOKS=''
# fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# zsh syntax highlighting
. /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


#### PATH extensions
## Custom scripts folder
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

# Android Studio
export ANDROID_DIR=$HOME/Library/Android/sdk
export PATH=$ANDROID_DIR/platform-tools/:$PATH
export PATH=$ANDROID_DIR/emulator/:$PATH
export PATH=$ANDROID_DIR/tools/:$PATH
export PATH=$ANDROID_DIR/tools/bin/:$PATH

######### CONFIG #########
# History 
export HISTSIZE=50000  # Maximum number of history lines in memory
export HISTFILESIZE=50000  # Maximum number of history lines on disk
export HISTCONTROL=ignoredups:erasedups  # Ignore duplicate lines
# shopt -s histappend  # When the shell exits, append to the history file instead of overwriting it
# After each command, append to the history file  and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Language support
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR="nvim"
  alias vim="nvim"
fi

# Docker
export DOCKER_DEFAULT_PLATFORM=linux/amd64
alias dockernuke="docker system prune --all --volumes"
[ -x "$(command -v lazydocker)" ] && alias lzd="lazydocker"

alias vz="nvim ~/.zshrc"
alias sz="source ~/.zshrc"
alias bi="HOMEBREW_NO_AUTO_UPDATE=1 brew install"

######### Aliases #########
# Dir navigations
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias lo="ls -o"
alias tre="tree -L 2"
alias treee="tree -L 3"

# Defaults replaced for better commands
if [ -x "$(command -v eza)" ]; then
  alias l="eza --icons --long --all --header"
  alias la="eza --icons --long --all --group -a"
  alias ls="eza"
  alias ll="eza --icons --long --header"
else
  alias l="ls -lah"
  alias la="ls -la"
  alias ll="ls -l"
fi

alias rm="safe-rm"

alias grep="grep --color=auto"
[ -x "$(command -v bat)" ] && alias cat="bat"

[ -x "$(command -v prettyping)" ] && alias ping="prettyping"

alias du="ncdu --color dark -x --exclude .git --exclude node_modules --exclude venv"
alias fvim='vim $(fzf --height 40%)' # not the same as alias fvim="vim $(fzf --height 40%)"

# Git shorthands
MAIN_BRANCH="main"

# Define pretty format for git log
git_pretty_config="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"

# alias fetch-prs="git fetch --all --prune +refs/pull-requests/*:refs/remotes/origin/pr/*"
# alias gitrod="git fetch --all --prune && git rebase origin/develop"
# alias gitromm="git fetch --all --prune && git rebase origin/master"
# alias gitrud="git fetch --all --prune && git rebase upstream/develop"
# alias gitrum="git fetch --all --prune && git rebase upstream/$MAIN_BRANCH"
# alias sgitromm="git stash -u && git fetch --all --prune && git rebase origin/master && git stash pop"
alias forgith="agrep forgit"
alias gds="gd --staged"
alias gitb="git branch"
alias gitc="git checkout "
alias gitcc="git checkout -"
alias gitl="git log -n 10 --graph --decorate"
alias gitrom="git fetch --all --prune && git rebase origin/$MAIN_BRANCH"
alias gitcm="gitc $MAIN_BRANCH && gitrom"
alias gitrub="git stash -u && git fetch --all --prune && git rebase origin/$(git_current_branch) && git stash pop"
alias gitrut="git fetch --all --prune && git rebase upstream/test"
alias gits="git switch"
alias gitss="clear && git branch --sort=-committerdate && git status"
alias gl="gitl -n 30 --oneline"
alias glol="git log -n 20 --graph --pretty='$git_pretty_config'"
alias glola="git log -n 20 --graph --all --pretty='$git_pretty_config'"
alias gshowe="git show --name-only -1 | fzf | xargs nvim"
alias sgitrom="git stash -u && git fetch --all --prune && git rebase origin/$MAIN_BRANCH && git stash pop"
alias ydiff="ydiff -s -w 100"
alias ydiffs="ydiff -s -w 100 --staged"

alias rmlock="rm package-lock.json && npm install --package-lock-only"

# Vim
# let g:coc_node_path = trim(system('which node'))
if [ -x "$(command -v nvim)" ]; then
  alias vim="nvim"
  alias v="vim +NvimTreeToggle +'Telescope find_files'"
  alias vz="vim ~/.zshrc"
  alias vt="vim ~/.config/tmux/tmux.conf"
  alias vc="vim ~/.config/nvim/"
  alias notes="cd ~/personal/notes && vim +'Telescope find_files' && cd -"
fi
alias sz=". ~/.zshrc"

# Lazyness
[ -x "$(command -v lazygit)" ] && alias lzg="lazygit"
alias c="clear"
alias ta="tmux attach || tmux"
alias nud="nvm use default"
# alias venv=". venv/bin/activate"
# alias dj="venv/bin/python manage.py "
# alias djm="dj migrate "
# alias djsm="dj showmigrations "
# alias djmm="dj makemigrations "

alias agrep="alias | grep "
alias psgrep="ps aux | grep "
alias printers="lpstat -a"
alias validate="npm run prettier && npm run lint:fix && npm run test"
alias nuke="rm package-lock.json && turbo run clean && npm i"
alias fd='find . -type d -name'
alias ff='find . -type f -name'

## Taskbook shorthands
# https://github.com/klaudiosinani/taskbook/tree/master
alias tbh="agrep tb"
alias tbc="tb | fzf --ansi | cut -d '.' -f 1 | xargs tb --check && tb" # check
alias tbd="tb | fzf --ansi | cut -d '.' -f 1 | xargs tb -d && tb" # delete
alias tbs="tb | fzf --ansi | cut -d '.' -f 1 | xargs tb -s && tb" # star
tbp() { tb -p @"$1" $2 && tb } # priority

alias tbi="tb --timeline"
alias tbt="tb --task" # taskbook task creation
alias tbn="tb --note" # taskbook notes
alias tbl="tb --list" # taskbook list
alias tblp="tb --list pending"
alias tbln="tb --list notes"
alias tbf="tb --find"

#today
alias tbtt="tbt @today"
alias tbtn="tbn @today"
alias tbtl="tb --list today"
tbtm() { tb -m @"$1" today && tb }

# 1on1
alias tbst="tbt @1on1"
alias tbsn="tbn @1on1"
alias tbsl="tb --list 1on1"
tbms() { tb -m @"$1" 1on1 && tb }

#recordatorios
alias tbrt="tbt @recordatorios"
alias tbrn="tbn @recordatorios"
alias tbrl="tb --list recordatorios"
tbmr() { tb -m @"$1" recordatorios && tb }

#viernes
alias tbvt="tbt @viernes"
alias tbvt="tbt @viernes"
alias tbvl="tb --list viernes"
tbmv() { tb -m @"$1" viernes && tb }


gclone() {
  git clone "$1" && cd "$(basename "$1" .git)" && cat README.md
}

reviewcandidate() {
  cd ~/dev/candidates && gclone "$1" && cp ~/Documents/luis.review.md . && vim luis.review.md
}

alias view="nvim -m"
alias rg="rg --hidden --smart-case"

######### TERMINAL ENHANCEMENTS #########

# # Zoxide
# [ -x "$(command -v zoxide)" ] && eval "$(zoxide init zsh)"
#
# # Fuzzy finder
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#
######### KEY BINDINGS #########
# Key bindings
bindkey -s ^f "tmux-sessionizer.sh\n"
bindkey -s ^s "tmux-fzf-session.sh\n"
bindkey '^y' autosuggest-accept # old was '^ '

#### Cool commands

# Generate password
function getpass() {
  cat /dev/urandom | LC_ALL=C tr -dc 'a-zA-Z0-9' | head -c $1
}
alias genpass="getpass 16"

# Lookup definition
function def() {
  curl -s https://api.dictionaryapi.dev/api/v2/entries/en/$1 | json_pp | rg "definition\""
}

# Create and jump directory
function mk() {
  mkdir $1 && cd $1
}

# Weather
alias weather="curl 'wttr.in/$WEATHER_LOC' && curl 'v2.wttr.in/$WEATHER_LOC'"
weatherin () {
  curl wttr.in/$1 && curl v2.wttr.in/$1
}
alias moon="curl wttr.in/moon"

# Diff files or directories
vdiff () {
  if [ "${#}" -ne 2 ] ; then
    echo "vdiff requires two arguments"
    echo "  comparing dirs:  vdiff dir_a dir_b"
    echo "  comparing files: vidff file_a file_b"
    return 1
  fi

  local left="${1}"
  local right="${2}"

  if [ -d "${left}" ] && [ -d "${right}" ] ; then
    vim +"DirDiff ${left} ${right}"
  else
    vim -d "${left}" "${right}"
  fi
}

# export BROWSER="wslview"

#### PATH extensions
## Custom scripts folder
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# WSL
# export PATH="/mnt/c/Users/luisg/wsl-bin:$PATH"
# # export PATH="/mnt/c/Users/luisg/wsl-bin:$PATH"
# notify-send() { wsl-notify-send.exe --category $WSL_DISTRO_NAME "${@}"; }

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
# export PYTHON_CONFIGURE_OPTS="--enable-framework"
export PYTHON_CONFIGURE_OPTS="--enable-shared"
[ -x "$(command -v pyenv)" ] && eval "$(pyenv init -)"

######### CUSTOM FUNCTIONS #########
show_project_contributors () {
  if [[ $PWD = $project ]]; then
    contributors_ranking=`git shortlog -sn --all`
    # echo $contributors_ranking | head --lines 10
    # echo "$project contributors ranking:"
    # echo "pos    commits  author"
    echo $contributors_ranking | rg --context 2 "`git config --get --global user.name`" --pretty
  fi
}

daily () {
  # show_project_contributors;
  echo "";
  curl "v2.wttr.in/$WEATHER_LOC";
  tb;
}

# # SSH config
# # Add ssh keys depending on the pwd
# check_allowed_paths() {
#   # Check if the current directory or its parents match the allowed paths
#   # Remove ssh keys
#   ssh-add -D 2> /dev/null
#   local current_dir="$PWD"
#   while [ "$current_dir" != "/" ]; do
#     if [[ "$current_dir" == ~/dev/dotfile/* || "$current_dir" == ~/dev/notes/* || "$current_dir" == ~/personal/* ]]; then
#       return 0
#     fi
#     current_dir=$(dirname "$current_dir")
#   done
#   return 1
# }
# if check_allowed_paths; then
#   ssh-add --apple-use-keychain "$personal_key" 2> /dev/null
# else
#   # ssh-add "$default_key" 2> /dev/null
#   ssh-add --apple-use-keychain "$default_key"
# fi

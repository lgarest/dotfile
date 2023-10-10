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
fi

# Docker
export DOCKER_DEFAULT_PLATFORM=linux/amd64
alias dockernuke="docker system prune --all --volumes"
[ -x "$(command -v lazydocker)" ] && alias lzd="lazydocker"

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
if [ -x "$(command -v exa)" ]; then
  alias l="exa --icons --long --all --header"
  alias la="exa --icons --long --all --group -a"
  alias ls="exa"
  alias ll="exa --icons --long --header"
else
  alias l="ls -lah"
  alias la="ls -la"
  alias ll="ls -l"
fi

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
alias gitrub="git stash -u && git fetch --all --prune && git rebase origin/$(git_current_branch) && git stash pop"
alias gitrut="git fetch --all --prune && git rebase upstream/test"
alias gits="gitss"
alias gitss="clear && git branch && git status"
alias gl="gitl -n 30 --oneline"
alias glol="git log -n 20 --graph --pretty='$git_pretty_config'"
alias glola="git log -n 20 --graph --all --pretty='$git_pretty_config'"
alias gshowe="git show --name-only -1 | fzf | xargs nvim"
alias sgitrom="git stash -u && git fetch --all --prune && git rebase origin/$MAIN_BRANCH && git stash pop"
alias ydiff="ydiff -s -w 100"
alias ydiffs="ydiff -s -w 100 --staged"

# Vim
# let g:coc_node_path = trim(system('which node'))
if [ -x "$(command -v nvim)" ]; then
  alias vim="nvim"
  alias v="vim +NvimTreeToggle +'Telescope find_files'"
fi
alias ctags="`brew --prefix`/bin/ctags"

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
alias fd='find . -type d -name'
alias ff='find . -type f -name'

## Taskbook shorthands
# https://github.com/klaudiosinani/taskbook/tree/master
alias tbh="agrep tb"
alias tbc="tb | fzf | cut -d '.' -f 1 | xargs tb --check"
alias tbtc="tb --task @coding"
alias tbtt="tb --task @this_week"
alias tbts="tb --task @setup"
alias tbtr="tb --task @retro"
alias tbretro="tb --task @retro"
alias tbtl="tb --task @learn"
alias tbt="tb --task"
alias tbn="tb --note"
alias tbd="tb | fzf | cut -d '.' -f 1 | xargs tb -d"

gclone() {
  git clone "$1" && cd "$(basename "$1" .git)" && cat README.md
}
reviewcandidate() {
  cd ~/dev/candidates && gclone "$1" && cp ~/Documents/luis.review.md . && vim luis.review.md
}

######### TERMINAL ENHANCEMENTS #########

# Zoxide
[ -x "$(command -v zoxide)" ] && eval "$(zoxide init zsh)"

# Fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Zsh syntax highlighting
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

# OLD sublime configs
# export SUBLIME_USER_DIR="~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/"
# export SUBLIME_BCKP_DIR="~/MEGA/backups/sublime.user.folder/"
# alias sublime-backup="cp -R $SUBLIME_USER_DIR $SUBLIME_BCKP_DIR;\
# echo Sublime Settings backed up in $SUBLIME_BCKP_DIR"
# alias sublime-backup-restore="cp -R $SUBLIME_BCKP_DIR $SUBLIME_USER_DIR;\
# echo Sublime Settings restored into $SUBLIME_USER_DIR"

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

# NVM
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh
# load nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use
# load nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

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

# SSH config
# Add ssh keys depending on the pwd
check_allowed_paths() {
  # Check if the current directory or its parents match the allowed paths
  # Remove ssh keys
  ssh-add -D 2> /dev/null
  local current_dir="$PWD"
  while [ "$current_dir" != "/" ]; do
    if [[ "$current_dir" == ~/dev/dotfile/* || "$current_dir" == ~/dev/notes/* || "$current_dir" == ~/personal/* ]]; then
      return 0
    fi
    current_dir=$(dirname "$current_dir")
  done
  return 1
}
if check_allowed_paths; then
  ssh-add "$personal_key"
else
  ssh-add --apple-use-keychain "$default_key"
fi


######### THEMES #########
# PowerLevel10k
# Displays a p10k segment with the current tmux session
function prompt_my_tmux_session() {
  if [[ $(echo $TMUX) ]]; then
    session="$(tmux display-message -p '#S')"
    p10k segment -f white -b 199 -t $session
  fi
}

. $HOMEBREW_PREFIX/opt/powerlevel10k/powerlevel10k.zsh-theme
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_CUSTOM_TMUX_SESSION="show_tmux_session"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh virtualenv custom_tmux_session dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{014}\u2570%F{cyan}\uF460%F{073}\uF460%F{109}\uF460%f "
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_ETC_ICON=''
POWERLEVEL9K_VCS_GIT_HOOKS=''

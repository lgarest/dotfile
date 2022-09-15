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
mk() {
    mkdir $1 && cd $1
}
getpass() {
    cat /dev/urandom | LC_ALL=C tr -dc 'a-zA-Z0-9' | head -c $1
}
alias genpass='getpass 16'
def() {
    curl -s https://api.dictionaryapi.dev/api/v2/entries/en/$1 | json_pp | rg "definition\""
}

# Key bindings
bindkey -s ^f "tmux-sessionizer.sh\n"
bindkey -s ^u "tmux-fzf-session.sh\n"
bindkey '^ ' autosuggest-accept

# Defaults replaced for better commands
if [ -x "$(command -v exa)" ]; then
	alias ls='exa'
	alias la='exa --long --all --group -a'
fi
alias grep='grep --color=auto'
alias cat='bat'
alias ping='prettyping --nolegend'
alias du="ncdu --color dark -x --exclude .git --exclude node_modules --exclude venv"
alias fvim='vim $(fzf --height 40%)'

# Vim
# let g:coc_node_path = trim(system('which node'))
alias vim="nvim"
alias v="nvim +CtrlPMRU"
alias ctags="`brew --prefix`/bin/ctags"

# Git shorthands
MAIN_BRANCH="main"
alias gitb="git branch"
alias gitc="git checkout "
alias gitcc="git checkout -"
alias gl="git log --graph --decorate -n 40"
alias gitss="clear && git branch && git status"
alias gitrut="git fetch --all --prune && git rebase upstream/test"
alias gitrum="git fetch --all --prune && git rebase upstream/$MAIN_BRANCH"
alias gitrud="git fetch --all --prune && git rebase upstream/develop"
alias gitrom="git fetch --all --prune && git rebase origin/$MAIN_BRANCH"
alias gitromm="git fetch --all --prune && git rebase origin/master"
alias sgitrom="git stash -u && git fetch --all --prune && git rebase origin/$MAIN_BRANCH && git stash pop"
alias sgitromm="git stash -u && git fetch --all --prune && git rebase origin/master && git stash pop"
alias gitrub="git stash -u && git fetch --all --prune && git rebase origin/$(git_current_branch) && git stash pop"
alias gitrod="git fetch --all --prune && git rebase origin/develop"
alias fetch-prs="git fetch --all --prune +refs/pull-requests/*:refs/remotes/origin/pr/*"
alias ydiff="ydiff -s -w 100"
alias ydiffs="ydiff -s -w 100 --staged"
alias gshowe="git show --name-only -1 | fzf | xargs nvim"
gclone() {
    git clone "$1" && cd "$(basename "$1" .git)"
}
reviewcandidate() {
    cd ~/dev/candidates && gclone "$1" && cp ~/Documents/luis.review.md . && vim luis.review.md
}

# Lazyness
alias ta="tmux attach || tmux"
alias venv=". venv/bin/activate"
alias nud="nvm use default"
alias lzd="lazydocker"
alias lzg="lazygit"
alias dj="venv/bin/python manage.py "
alias djsm="venv/bin/python manage.py showmigrations "
alias djmm="venv/bin/python manage.py makemigrations "
alias djm="venv/bin/python manage.py migrate "
alias agrep="alias | grep "
alias psgrep="ps aux | grep "
alias printers="lpstat -a"
alias forgith="agrep forgit"

## tb shorthands
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

#### Cool commands

# Weather
alias weather="curl 'wttr.in/$WEATHER_LOC' && curl 'v2.wttr.in/$WEATHER_LOC'"
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

export SUBLIME_USER_DIR="~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/"
export SUBLIME_BCKP_DIR="~/MEGA/backups/sublime.user.folder/"
alias sublime-backup="cp -R $SUBLIME_USER_DIR $SUBLIME_BCKP_DIR;\
echo Sublime Settings backed up in $SUBLIME_BCKP_DIR"
alias sublime-backup-restore="cp -R $SUBLIME_BCKP_DIR $SUBLIME_USER_DIR;\
echo Sublime Settings restored into $SUBLIME_USER_DIR"

export DEV_DIR="$HOME/dev"

# PowerLevel10k
# Displays a p10k segment with the current tmux session
function prompt_my_tmux_session() {
    if [[ $(echo $TMUX) ]]; then
        session="$(tmux display-message -p '#S')"
        p10k segment -f white -b 199 -t $session
    fi
}

# . $DEV_DIR/powerlevel10k/powerlevel10k.zsh-theme
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

# fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# zsh syntax highlighting
#. /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# NVM
export NVM_DIR="$HOME/.nvm"
# load nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use
# load nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


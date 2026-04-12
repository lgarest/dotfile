# =============================================================================
# Fish shell configuration - Version controlled dotfile
# =============================================================================
# This file contains common configuration that can be shared across machines.
# Machine-specific configuration should be kept in ~/.config/fish/config.fish

# List of plugins used (for reference):

# jorgebucaran/fisher
# kidonng/zoxide.fish
# patrickf1/fzf.fish
# jorgebucaran/hydro
# jorgebucaran/nvm.fish

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Theme config for hydro
# jorgebucaran/hydro
set -g hydro_color_git green
set -g hydro_color_pwd yellow

set -g extendedglob on


# =============================================================================
# Tool Integration
# =============================================================================

# ZOXIDE integration
if type -q zoxide
    alias cd "z"
end

if type -q eza
    alias ll "eza -l --group-directories-first --icons"
    alias la "eza -la --group-directories-first --icons"
end


# =============================================================================
# Aliases and Functions
# =============================================================================

# NVIM shortcuts
alias v "vim +NvimTreeToggle +'Telescope frecency workspace=CWD path_display=smart'"
alias notes "cd ~/personal/notes && vim +'Telescope find_files' && cd -"

alias vf "vim ~/.config/fish/config.fish"
alias sf "source ~/.config/fish/config.fish"

# Core system aliases
alias ta "tmux attach || tmux"
abbr --add bi "HOMEBREW_NO_AUTO_UPDATE=1 brew install"
alias kills "tmux kill-session -t (tmux ls | fzf | cut -d ':' -f 1)"

# Agentic development with tmux
# alias agentic "~/personal/dotfile/scripts/tmux-agentic-dev.sh"

# Tree shortcuts
abbr --add tre "tree -L 2 -I 'node_modules|.git|.next|.turbo|dist|build'"
abbr --add treee "tree -L 3"

# Search & Find
abbr --add psgrep "ps aux | grep "
abbr --add agrep "abbr --show | grep "

# =============================================================================
# Git Integration (using existing git plugin abbreviations)
# =============================================================================

abbr --add gitss "clear && git status && git branch -vv"
abbr --add ggpush "git push origin (git branch --show-current)"
abbr --add ggpull "git pull origin (git branch --show-current)"
abbr --add ghpr "gh pr checkout "
abbr --add gitb "git branch"
abbr --add gitc "git checkout "
abbr --add gitcc "git checkout -"
abbr --add gits "git switch"
abbr --add gitromm "git fetch --all --prune && git rebase origin/main"
abbr --add sgitromm "git stash -u && git fetch --all --prune && git rebase origin/main && git stash pop"
# alias gitrom "git fetch --all --prune && git rebase origin/main"
alias gitrob "git fetch --all --prune && git rebase origin/(git branch --show-current)"
function gitcm
    git checkout main && eval (expand_abbr gfa) && eval (expand_abbr grbm)
end
# abbr --add grom "gfa && grbom"
function grom
    gfa && eval (expand_abbr grbom)
end
function gitbb
    eval (expand_abbr gco) main && grom && eval (expand_abbr gswc) $argv
end
function vstash
    git stash -u && grom && git stash pop
end

# =============================================================================
# JavaScript/Node Development
# =============================================================================

alias nrd "npm run dev"
abbr --add nrt "npm run test "
abbr --add nrit "npm i && npm run test "
if type -q mprocs
  alias validate "mprocs 'npm run format && npm run lint:fix' 'npm run type-check' 'npm run test'"
else
  alias validate "npm run format && npm run type-check && npm run lint:fix && npm run test"
end
alias rmlock "rm package-lock.json && npm install --package-lock-only"

# Nuclear option for cleaning JS projects
alias nuke "find . -type d \\( -name 'node_modules' -o -name '.turbo' -o -name '.next' -o -name '*dist' \\) -prune -exec rm -rf '{}' +; find . -name 'package-lock.json' -prune -exec rm -rf '{}' +; or true"

# =============================================================================
# Utility Functions
# =============================================================================

# Benchmark fish startup time
function fishbench
    echo "Benchmarking fish startup time..."
    echo ""
    
    # Run 5 times and show each result
    echo "Individual runs:"
    for i in (seq 5)
        time fish -i -c exit
    end
    
    echo ""
    echo "To see detailed profile, run:"
    echo "  fish --profile-startup=/tmp/fish-profile.txt -i -c exit"
    echo "  sort -nr /tmp/fish-profile.txt | head -20"
end

# Function to expand abbreviations - useful for using abbr in functions/aliases
function expand_abbr
    if test (count $argv) -eq 0
        echo "Usage: expand_abbr <abbreviation>"
        return 1
    end
    
    set abbr_name $argv[1]
    set expansion (abbr --show $abbr_name 2>/dev/null | grep "^abbr -a -- $abbr_name " | head -1 | string replace "abbr -a -- $abbr_name " "")
    
    if test -n "$expansion"
        # Remove quotes if present
        echo $expansion | string replace -r "^'(.*)'\$" '\1' | string replace -r '^"(.*)"\$' '\1'
    else
        echo "Abbreviation '$abbr_name' not found"
        return 1
    end
end

# Create and jump directory
function mk
    mkdir $argv; and cd $argv
end

# Clone git repo and read README
function gclone
    git clone $argv[1]; and cd (basename $argv[1] .git); and cat README.md
end

# Generate password
function getpass
    cat /dev/urandom | LC_ALL=C tr -dc 'a-zA-Z0-9' | head -c $argv
end
alias genpass "getpass 16"

# Lookup definition
function def
    curl -s https://api.dictionaryapi.dev/api/v2/entries/en/$argv | json_pp | rg "definition\""
end

# Weather commands
alias weather "curl 'wttr.in/$WEATHER_LOC' && curl 'v2.wttr.in/$WEATHER_LOC'"
function weatherin
    curl wttr.in/$argv && curl v2.wttr.in/$argv
end
alias moon "curl wttr.in/moon"

# Utils
function notify-me
    if $argv and eval $argv
        osascript -e 'display notification "'(string join " " $argv )' -> succeeded!" with title "Automatic notifier"'
    else
        osascript -e 'display notification "'(string join " " $argv )' -> failed." with title "Automatic notifier"'
    end
end

alias confetti "open -g raycast://extensions/raycast/raycast/confetti"
alias n "~/bin/braindump.sh"
alias vn "ls ~/personal/notes/dumps/ | fzf --query='' --print-query | xargs -I {} nvim ~/personal/notes/dumps/{}"
alias tn "ls ~/personal/notes/dumps/ | fzf --query='' --print-query | xargs -I {} tail -n 5 ~/personal/notes/dumps/{}"


# =============================================================================
# fzf Functions (enhanced productivity)
# =============================================================================

# Search and edit files
# use Ctrl+alt+f
function ff
    set file (find . -type f | fzf --preview 'head -100 {}')
    if test -n "$file"
        $EDITOR $file
    end
end

# Search and cd to directory
# use alt+c
# function fd
#     set dir (find . -type d | fzf)
#     if test -n "$dir"
#         cd $dir
#     end
#     pwd
# end
function fd
    echo "Use Alt+C to search and cd to directory"
end

# Search processes and kill
function fkill
    set pid (ps -ef | sed 1d | fzf -m | awk '{print $2}')
    if test -n "$pid"
        echo $pid | xargs kill -9
    end
end

# Search git branches and checkout
function fco
    set branch (git branch | fzf | string trim)
    if test -n "$branch"
        git checkout $branch
    end
end

# Search command history and execute
# use Ctrl+R from fzf plugin
# function fh
#     set cmd (history | fzf)
#     if test -n "$cmd"
#         eval $cmd
#     end
# end
function fh
  echo "Use Ctrl+R to search command history"
end

# Search environment variables
# Use Ctrl+V from fzf plugin
# function fenv
#     set var (env | fzf)
#     if test -n "$var"
#         echo $var
#     end
# end
function fenv
  echo "Use Ctrl+V to search env variables"
end

# =============================================================================
# Key Bindings
# =============================================================================

# Tmux session management
bind \cf "~/bin/tmux-sessionizer.sh"
bind \cs "~/bin/tmux-fzf-session.sh"
bind \cy accept-autosuggestion
bind \cn forward-word

# =============================================================================
# Tool Initialization (Lazy loaded from local config)
# =============================================================================


# Lazy load common tools for faster startup
function __fish_setup_tools --on-variable PWD --on-event fish_prompt
    functions -e __fish_setup_tools
    
    if type -q bat
        alias cat "bat"
        # export PAGER="bat --style=numbers --line-range=all"
        set -gx MANPAGER bat
    end
    
    if type -q lazygit
        alias lzg "lazygit"
    end
    
    if type -q nvim
        set -gx EDITOR nvim
        alias vim "nvim"
        alias view "nvim -m"
    end
end

# Lazy load plugins for faster startup
function __fish_load_integrations --on-event fish_prompt
    functions -e __fish_load_integrations
    
    if type -q fzf
        set -g fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"
        fzf --fish | source
        echo "FZF mappings:
  cd to directory   Alt+C       
  files             Ctrl+Alt+F (Ctrl+O to open in nvim)
  git log           Ctrl+Alt+L  
  git status        Ctrl+Alt+S  
  processes         Ctrl+Alt+P  
  env variables     Ctrl+V
  "
    end

    echo "Useful aliases:
  n something       to braindump a quick note
  vn                to fuzzy find and edit notes
  v                 to open nvim with file explorer and fuzzy finder
  vf                to edit and source fish config
  sf                to source fish config
  ta                to attach or start tmux session
  <space>G          to open a new tmux window with lazygit
  <space>N          to open a new tmux window with logs
  <space>T          to open a new tmux window with todos
    "
    
    if type -q zoxide
        zoxide init fish | source
    end

    if test -f ~/.config/fish/functions/nvm.fish
        source ~/.config/fish/functions/nvm.fish
    end
    if type -q nvm
        nvm use --silent $nvm_default_version 2>/dev/null || true
    end
end

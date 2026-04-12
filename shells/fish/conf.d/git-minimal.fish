# Minimal git abbreviations - based on your actual usage
# This replaces the OMF git plugin which creates 171 abbreviations
# Based on analysis of your history and config.fish

if status --is-interactive
    # CRITICAL: Only the most frequently used git commands
    # Less common ones are lazy-loaded in 99-lazy-load.fish
    
    # Core git commands (most used based on your config)
    abbr -a -g ga 'git add'
    abbr -a -g gco 'git checkout'
    abbr -a -g gcb 'git checkout -b'
    abbr -a -g gc 'git commit -v'
    abbr -a -g gcv 'git commit -v --no-verify'
    abbr -a -g gd 'git diff'
    
    # Essential branch commands
    abbr -a -g gb 'git branch -vv'
    abbr -a -g gsw 'git switch'
    abbr -a -g gswc 'git switch --create'
    
    # Rebase (you use this frequently based on your functions)
    abbr -a -g grb 'git rebase'
    abbr -a -g grbm 'git rebase (__git.default_branch)'
    abbr -a -g grbom 'git fetch origin (__git.default_branch); and git rebase FETCH_HEAD'
    abbr -a -g grbi 'git rebase --interactive'
    abbr -a -g grbc 'git rebase --continue'
    abbr -a -g grba 'git rebase --abort'
    
    # Fetch (essential for your workflow)
    abbr -a -g gf 'git fetch'
    abbr -a -g gfa 'git fetch --all --prune'
    
    # Basic reset & restore
    abbr -a -g grs 'git restore'
    abbr -a -g grh 'git reset'
    
    # Your most-used custom abbreviations
    abbr -a -g gitss 'clear && git status && git branch'
    abbr -a -g ggpush 'git push origin (git branch --show-current)'
    
    # Helper function for default branch detection (used by abbreviations)
    function __git.default_branch
        command git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | string replace 'refs/remotes/origin/' ''
        or echo main
    end
    
    # Helper function for current branch (used by abbreviations)
    function __git.current_branch
        command git symbolic-ref --short HEAD 2>/dev/null
        or command git rev-parse --short HEAD 2>/dev/null
    end
end

# Optimized brew configuration for Apple Silicon Mac
# This avoids the expensive path detection in OMF's brew plugin

if status --is-interactive
    # Hardcode the brew path for Apple Silicon
    set -gx HOMEBREW_PREFIX /opt/homebrew
    set -gx HOMEBREW_CELLAR /opt/homebrew/Cellar
    set -gx HOMEBREW_REPOSITORY /opt/homebrew
    
    # Add to PATH if not already present
    if not contains /opt/homebrew/bin $PATH
        set -gx PATH /opt/homebrew/bin $PATH
    end
    if not contains /opt/homebrew/sbin $PATH
        set -gx PATH /opt/homebrew/sbin $PATH
    end
end

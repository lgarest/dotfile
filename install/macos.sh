#!/bin/bash

# =============================================================================
# macOS Installer Script
# =============================================================================
# Installation process for setting up dotfiles and tools on macOS
# =============================================================================

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# =============================================================================
# Utility Functions
# =============================================================================

log() {
    echo -e "${2:-$NC}[$(date +'%Y-%m-%d %H:%M:%S')] $1${NC}"
}

info() {
    log "INFO: $1" "$BLUE"
}

success() {
    log "SUCCESS: $1" "$GREEN"
}

error() {
    log "ERROR: $1" "$RED"
    exit 1
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install Homebrew
install_homebrew() {
    if ! command_exists brew; then
        info "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        
        # Add Homebrew to PATH
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
        
        success "Homebrew installed"
    else
        info "Homebrew already installed"
    fi
}

# Brew install packages
install_brew_packages() {
    info "Installing packages from Brewfile..."
    brew bundle --file="$DOTFILES_DIR/Brewfile"
    success "Brew packages installed"
}

# Setup directories
setup_directories() {
    info "Setting up directories..."
    mkdir -p ~/.config/fish
    mkdir -p ~/.config/nvim
    mkdir -p ~/dev
    mkdir -p ~/venvs
    success "Directories created"
}

# Install tmux plugin manager
install_tmux_plugins() {
    info "Installing tmux plugin manager..."
    if [[ ! -d ~/.tmux/plugins/tpm ]]; then
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
        success "TMux plugin manager installed"
    else
        info "TMux plugin manager already installed"
    fi
}

# Setup shell configurations
setup_shell() {
    info "Setting up shell configurations..."
    
    # Fish shell setup (if any specific setup is needed)
    info "Fish shell will be configured via config.fish"
    
    success "Shell configuration completed"
}

# Setup development environment
setup_development() {
    info "Setting up development environment..."
    
    # Install fzf key bindings
    if command_exists fzf; then
        $(brew --prefix)/opt/fzf/install --all
    fi
    
    # Setup pyenv
    if command_exists pyenv; then
        info "Installing Python 3.11 via pyenv..."
        pyenv install 3.11.9 || true
        pyenv global 3.11.9
        
        # Create Python virtual environment for neovim
        if [[ ! -d ~/venvs/py3nvim ]]; then
            mkdir -p ~/venvs
            cd ~/venvs
            python3 -m venv py3nvim
            ~/venvs/py3nvim/bin/pip3 install neovim pynvim black
            cd - > /dev/null
        fi
    fi
    
    # Setup Node.js
    if command_exists nvm; then
        info "Installing Node.js LTS via nvm..."
        nvm install --lts
        nvm use --lts
        npm install -g neovim prettier
    fi
}

# Symlink dotfiles
symlink_dotfiles() {
    info "Symlinking dotfiles..."
    
    # Create symlinks for dotfiles
    ln -svf "$DOTFILES_DIR/tmux.conf" "$HOME/.tmux.conf"
    ln -svf "$DOTFILES_DIR/config.fish" "$HOME/.config/fish/config.fish"
    
    # Symlink nvim configuration
    if [[ -d "$DOTFILES_DIR/nvim-lua2" ]]; then
        ln -svf "$DOTFILES_DIR/nvim-lua2" "$HOME/.config/nvim"
    fi
    
    success "Dotfiles symlinked"
}

# Setup git configuration
setup_git() {
    info "Setting up git configuration..."
    git config --global pager.branch false
    git config --global core.editor "nvim"
    success "Git configuration set"
}

# Perform installation steps for macOS
main() {
    info "Starting macOS installation..."
    setup_directories
    install_homebrew
    install_brew_packages
    setup_shell
    install_tmux_plugins
    setup_development
    symlink_dotfiles
    setup_git
    
    success "macOS installation completed!"
}

# Script execution
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"
main

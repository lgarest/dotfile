#!/bin/bash

# =============================================================================
# Dotfiles Management Script
# =============================================================================
# Utility script for managing dotfiles installation, updates, and maintenance
# =============================================================================

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$SCRIPT_DIR"

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

warning() {
    log "WARNING: $1" "$YELLOW"
}

error() {
    log "ERROR: $1" "$RED"
    exit 1
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# =============================================================================
# Management Functions
# =============================================================================

# Install dotfiles
install_dotfiles() {
    info "Installing dotfiles..."
    bash "$DOTFILES_DIR/install.sh" "$@"
}

# Update dotfiles from git
update_dotfiles() {
    info "Updating dotfiles from git..."
    cd "$DOTFILES_DIR"
    git pull origin main
    success "Dotfiles updated from git"
}

# Update system packages
update_packages() {
    info "Updating system packages..."
    
    if command_exists brew; then
        info "Updating Homebrew packages..."
        brew update && brew upgrade
        brew bundle --file="$DOTFILES_DIR/Brewfile"
        success "Homebrew packages updated"
    elif command_exists apt; then
        info "Updating apt packages..."
        sudo apt update && sudo apt upgrade -y
        success "Apt packages updated"
    else
        warning "No supported package manager found"
    fi
}

# Clean up old configurations
cleanup() {
    info "Cleaning up old configurations..."
    
    # Remove old backup directories older than 30 days
    find "$HOME" -maxdepth 1 -name ".dotfiles_backup_*" -type d -mtime +30 -exec rm -rf {} \;
    
    # Clean up broken symlinks
    find "$HOME" -maxdepth 1 -type l ! -exec test -e {} \; -delete
    
    success "Cleanup completed"
}

# Show status of dotfiles
show_status() {
    info "Dotfiles status:"
    echo
    
    # Git status
    echo -e "${BLUE}Git Status:${NC}"
    cd "$DOTFILES_DIR"
    git status --short
    echo
    
    # Symlink status
    echo -e "${BLUE}Symlink Status:${NC}"
    local dotfiles=(
        ".tmux.conf"
        ".config/fish/config.fish"
        ".config/nvim"
    )
    
    for dotfile in "${dotfiles[@]}"; do
        if [[ -L "$HOME/$dotfile" ]]; then
            echo -e "${GREEN}✓${NC} $dotfile -> $(readlink "$HOME/$dotfile")"
        elif [[ -e "$HOME/$dotfile" ]]; then
            echo -e "${YELLOW}!${NC} $dotfile (exists but not symlinked)"
        else
            echo -e "${RED}✗${NC} $dotfile (missing)"
        fi
    done
    echo
    
    # Tool status
    echo -e "${BLUE}Tool Status:${NC}"
    local tools=("git" "nvim" "tmux" "fzf" "ripgrep" "bat" "tree" "htop")
    
    for tool in "${tools[@]}"; do
        if command_exists "$tool"; then
            echo -e "${GREEN}✓${NC} $tool"
        else
            echo -e "${RED}✗${NC} $tool (not installed)"
        fi
    done
}

# Uninstall dotfiles
uninstall_dotfiles() {
    info "Uninstalling dotfiles..."
    
    # Remove symlinks
    local dotfiles=(
        ".tmux.conf"
        ".config/fish/config.fish"
        ".config/nvim"
    )
    
    for dotfile in "${dotfiles[@]}"; do
        if [[ -L "$HOME/$dotfile" ]]; then
            rm "$HOME/$dotfile"
            info "Removed symlink: $dotfile"
        fi
    done
    
    success "Dotfiles uninstalled"
}

# Show help
show_help() {
    cat << EOF
Usage: $0 [COMMAND] [OPTIONS]

Manage your dotfiles installation and configuration.

COMMANDS:
    install     Install dotfiles and development environment
    update      Update dotfiles from git and system packages
    status      Show status of dotfiles and tools
    cleanup     Clean up old backups and broken symlinks
    uninstall   Remove dotfiles symlinks
    help        Show this help message

OPTIONS:
    --skip-backup   Skip backing up existing dotfiles (install only)

EXAMPLES:
    $0 install                  # Install dotfiles
    $0 install --skip-backup    # Install without backing up
    $0 update                   # Update everything
    $0 status                   # Show current status
    $0 cleanup                  # Clean up old files

EOF
}

# =============================================================================
# Main Function
# =============================================================================

main() {
    case "${1:-help}" in
        "install")
            shift
            install_dotfiles "$@"
            ;;
        "update")
            update_dotfiles
            update_packages
            ;;
        "status")
            show_status
            ;;
        "cleanup")
            cleanup
            ;;
        "uninstall")
            uninstall_dotfiles
            ;;
        "help"|"--help"|"-h")
            show_help
            ;;
        *)
            error "Unknown command: $1. Use '$0 help' for usage information."
            ;;
    esac
}

# Run main function
main "$@"

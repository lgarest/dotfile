#!/bin/bash

# =============================================================================
# Dotfiles Installation Script
# =============================================================================
# Main installer that detects OS and runs the appropriate installation script
# Supports macOS and Ubuntu/Debian
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

# Logging
LOG_FILE="$DOTFILES_DIR/install.log"

# =============================================================================
# Utility Functions
# =============================================================================

log() {
    echo -e "${2:-$NC}[$(date +'%Y-%m-%d %H:%M:%S')] $1${NC}" | tee -a "$LOG_FILE"
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

# Detect OS
detect_os() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macos"
    elif [[ -f /etc/debian_version ]] || [[ -f /etc/lsb-release ]]; then
        echo "ubuntu"
    else
        echo "unknown"
    fi
}

# Display banner
show_banner() {
    cat << 'EOF'
╔══════════════════════════════════════════════════════════════════════════════╗
║                           DOTFILES INSTALLER                                ║
║                                                                              ║
║  This script will install and configure your development environment        ║
║  including shell configuration, development tools, and applications.        ║
╚══════════════════════════════════════════════════════════════════════════════╝
EOF
}

# Check prerequisites
check_prerequisites() {
    info "Checking prerequisites..."
    
    # Check if git is installed
    if ! command_exists git; then
        error "Git is not installed. Please install git first."
    fi
    
    # Check if we're in a git repository
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        error "This script must be run from within the dotfiles git repository."
    fi
    
    success "Prerequisites check passed"
}

# Backup existing dotfiles
backup_existing_dotfiles() {
    if [[ "${SKIP_BACKUP:-}" == "1" ]]; then
        info "Skipping dotfiles backup"
        return
    fi
    
    info "Backing up existing dotfiles..."
    
    local backup_dir="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$backup_dir"
    
    # List of common dotfiles to backup
    local dotfiles=(
        ".bashrc"
        ".bash_profile"
        ".zshrc"
        ".tmux.conf"
        ".vimrc"
        ".config/fish/config.fish"
        ".config/nvim"
    )
    
    for dotfile in "${dotfiles[@]}"; do
        if [[ -e "$HOME/$dotfile" ]]; then
            info "Backing up $dotfile"
            mkdir -p "$backup_dir/$(dirname "$dotfile")"
            cp -r "$HOME/$dotfile" "$backup_dir/$dotfile"
        fi
    done
    
    if [[ -n "$(ls -A "$backup_dir" 2>/dev/null)" ]]; then
        success "Dotfiles backed up to: $backup_dir"
    else
        rm -rf "$backup_dir"
        info "No existing dotfiles to backup"
    fi
}

# Main installation function
main() {
    show_banner
    
    info "Starting dotfiles installation..."
    info "Dotfiles directory: $DOTFILES_DIR"
    info "Log file: $LOG_FILE"
    
    # Initialize log file
    echo "=== Dotfiles Installation Log - $(date) ===" > "$LOG_FILE"
    
    # Check prerequisites
    check_prerequisites
    
    # Detect OS
    local os
    os=$(detect_os)
    info "Detected OS: $os"
    
    # Backup existing dotfiles
    backup_existing_dotfiles
    
    # Run OS-specific installer
    case "$os" in
        "macos")
            info "Running macOS installer..."
            if [[ -f "$SCRIPT_DIR/install/macos.sh" ]]; then
                bash "$SCRIPT_DIR/install/macos.sh"
            else
                error "macOS installer script not found at $SCRIPT_DIR/install/macos.sh"
            fi
            ;;
        "ubuntu")
            info "Running Ubuntu installer..."
            if [[ -f "$SCRIPT_DIR/install/ubuntu.sh" ]]; then
                bash "$SCRIPT_DIR/install/ubuntu.sh"
            else
                error "Ubuntu installer script not found at $SCRIPT_DIR/install/ubuntu.sh"
            fi
            ;;
        *)
            error "Unsupported OS: $os. This installer only supports macOS and Ubuntu."
            ;;
    esac
    
    success "Installation completed successfully!"
    success "Please restart your terminal or source your shell configuration to apply changes."
    
    # Show next steps
    cat << EOF

=== NEXT STEPS ===
1. Restart your terminal or source your shell configuration
2. Run 'tmux' and press 'prefix + I' to install tmux plugins
3. Open nvim and run ':Lazy sync' to install/update plugins
4. Customize your configuration files as needed

For more information, check the documentation in the docs/ directory.
EOF
}

# Handle script arguments
case "${1:-}" in
    "--help"|"-h")
        cat << EOF
Usage: $0 [OPTIONS]

Install and configure dotfiles for your development environment.

OPTIONS:
    -h, --help      Show this help message
    --skip-backup   Skip backing up existing dotfiles

EXAMPLES:
    $0                  # Install with default options
    $0 --skip-backup    # Install without backing up existing files

EOF
        exit 0
        ;;
    "--skip-backup")
        export SKIP_BACKUP=1
        ;;
esac

# Run main installation
main "$@"

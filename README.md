# Dotfiles

A comprehensive configuration setup for macOS and Ubuntu development environments, featuring modern shell configurations, development tools, and editor setups.

## Features

- **Multi-OS Support**: Automatic detection and installation for macOS and Ubuntu
- **Modern Shell Setup**: Fish shell with powerful aliases and functions
- **Development Tools**: Neovim, tmux, fzf, ripgrep, and more
- **Git Integration**: Enhanced git workflow with useful aliases
- **Package Management**: Homebrew (macOS) and apt (Ubuntu) integration
- **Backup System**: Automatic backup of existing dotfiles
- **Easy Management**: Simple scripts for installation, updates, and maintenance

## Quick Start

### One-Line Install

```bash
curl -fsSL https://raw.githubusercontent.com/lgarest/dotfile/main/install.sh | bash
```

### Manual Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/lgarest/dotfile.git
   cd dotfile
   ```

2. Run the installer:
   ```bash
   ./install.sh
   ```

3. Restart your terminal or source your shell configuration

## What Gets Installed

### macOS
- **Package Manager**: Homebrew
- **Shell**: Fish shell, Oh My Zsh with powerlevel10k
- **Development Tools**: Neovim, tmux, fzf, ripgrep, bat, tree, htop
- **Programming Languages**: Python (via pyenv), Node.js (via nvm)
- **Applications**: Various casks from Brewfile

### Ubuntu
- **System Update**: Latest packages via apt
- **Shell**: Fish shell, Oh My Zsh, zsh
- **Development Tools**: Neovim, tmux, fzf, ripgrep, bat, tree, htop
- **Programming Languages**: Python, Node.js, npm
- **Build Tools**: build-essential, curl, git

## Directory Structure

```
dotfile/
├── install.sh              # Main installer script
├── manage.sh               # Management utility script
├── install/
│   ├── macos.sh            # macOS-specific installation
│   └── ubuntu.sh           # Ubuntu-specific installation
├── config.fish             # Fish shell configuration
├── tmux.conf               # tmux configuration
├── vimrc                   # Vim configuration
├── zshrc                   # Zsh configuration
├── Brewfile                # Homebrew packages
├── nvim-lua2/              # Neovim configuration (NvChad)
├── scripts/                # Utility scripts
└── docs/                   # Documentation
```

## Management Commands

Use the `manage.sh` script for easy dotfiles management:

```bash
# Install dotfiles
./manage.sh install

# Install without backing up existing files
./manage.sh install --skip-backup

# Update dotfiles and packages
./manage.sh update

# Show status of dotfiles and tools
./manage.sh status

# Clean up old backups and broken symlinks
./manage.sh cleanup

# Uninstall dotfiles
./manage.sh uninstall

# Show help
./manage.sh help
```

## Configuration Highlights

### Fish Shell
- **Smart Aliases**: Productive shortcuts for common tasks
- **FZF Integration**: Fuzzy finding for files, directories, and command history
- **Git Workflow**: Enhanced git commands and abbreviations
- **Development Tools**: Node.js, Python, and JavaScript specific aliases
- **Utility Functions**: Password generation, weather, notifications

### Tmux
- **Modern Key Bindings**: Intuitive navigation and window management
- **Plugin System**: TPM (Tmux Plugin Manager) with useful plugins
- **Theme**: Catppuccin theme for beautiful appearance
- **Warp AI Integration**: Special bindings for Warp terminal AI features

### Neovim
- **NvChad Configuration**: Modern Neovim setup with LSP, treesitter, and more
- **Language Support**: Comprehensive language server configurations
- **Plugin Management**: Lazy.nvim for efficient plugin loading
- **Theme**: Bearded Arc theme with light/dark toggle

## Key Features

### Automatic Backup
- Existing dotfiles are automatically backed up before installation
- Backup directory: `~/.dotfiles_backup_YYYYMMDD_HHMMSS`
- Cleanup command removes backups older than 30 days

### Symlink Management
- All dotfiles are symlinked, not copied
- Easy to update and maintain
- Broken symlinks are automatically cleaned up

### Cross-Platform Compatibility
- Automatic OS detection
- Platform-specific package installation
- Consistent experience across macOS and Ubuntu

## Customization

### Adding New Configurations
1. Add your configuration file to the dotfiles directory
2. Update the appropriate installer script to symlink it
3. Add it to the status check in `manage.sh`

### Modifying Package Lists
- **macOS**: Edit `Brewfile` to add/remove Homebrew packages
- **Ubuntu**: Modify the package list in `install/ubuntu.sh`

### Shell Configuration
- **Fish**: Edit `config.fish` for Fish shell customizations
- **Zsh**: Edit `zshrc` for Zsh configurations

## Troubleshooting

### Common Issues

1. **Permission Denied**: Make sure scripts are executable
   ```bash
   chmod +x install.sh manage.sh
   ```

2. **Symlink Conflicts**: Use `--skip-backup` or manually remove conflicting files

3. **Package Installation Failures**: Check network connection and package manager status

### Getting Help

- Check the status: `./manage.sh status`
- View installation logs: `cat install.log`
- Check symlinks: `ls -la ~/ | grep -E '\->'`

## Post-Installation

### Tmux Setup
1. Open tmux: `tmux`
2. Install plugins: `prefix + I` (Ctrl+Space + I)

### Neovim Setup
1. Open neovim: `nvim`
2. Install/update plugins: `:Lazy sync`

### Shell Configuration
1. Restart terminal or source configuration
2. For Fish: `source ~/.config/fish/config.fish`
3. For Zsh: `source ~/.zshrc`

## Contributing

1. Fork the repository
2. Create a feature branch
3. Add your improvements
4. Test on both macOS and Ubuntu if possible
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) for the zsh framework
- [NvChad](https://github.com/NvChad/NvChad) for the Neovim configuration
- [Homebrew](https://brew.sh/) for macOS package management
- [Fish Shell](https://fishshell.com/) for the friendly interactive shell
- [Tmux](https://github.com/tmux/tmux) for terminal multiplexing

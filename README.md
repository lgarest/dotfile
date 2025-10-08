# Dotfiles

A comprehensive configuration setup for macOS development environments, featuring Fish shell configuration, Neovim (NvChad), tmux, and modern development tools.

## Features

- **Shell Setup**: Fish shell with powerful aliases, abbreviations, and functions
- **Editor**: Neovim with NvChad configuration and modular plugin architecture
- **Terminal Multiplexer**: tmux with Catppuccin theme and Warp AI integration
- **Development Tools**: fzf, ripgrep, bat, eza, fd, lazygit, and more
- **Git Integration**: Enhanced git workflow with lazygit and useful aliases
- **Package Management**: Homebrew integration with curated package list
- **Utilities**: Weather scripts, tmux sessionizer, and development helpers

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

### Core Tools
- **Shell**: Fish shell with custom configuration
- **Editor**: Neovim with NvChad and custom plugin organization
- **Terminal**: Warp (AI-powered terminal)
- **Multiplexer**: tmux with custom key bindings and plugins

### Development Tools
- **File Management**: eza (modern ls), fd (find alternative), fzf (fuzzy finder)
- **Code Search**: ripgrep, universal-ctags
- **Git Tools**: git-delta, lazygit, tig
- **Languages**: Python (via pyenv), Node.js, Deno
- **Package Managers**: Homebrew, pnpm, yarn
- **Utilities**: bat (cat with syntax highlighting), jq, cloc, tree

### GUI Applications (via Homebrew Cask)
- **Editors**: Zed
- **API Testing**: Insomnia
- **Fonts**: JetBrains Mono, Meslo LG Nerd Font, Hack Nerd Font
- **Utilities**: HiddenBar, CakeBrew

## Directory Structure

```
dotfile/
├── install.sh              # Main installer script
├── manage.sh               # Management utility script
├── install/
│   ├── macos.sh            # macOS-specific installation
│   └── ubuntu.sh           # Ubuntu-specific installation (legacy)
├── config.fish             # Fish shell configuration
├── tmux.conf               # tmux configuration
├── Brewfile                # Homebrew packages and casks
├── nvim-lua2/              # Neovim configuration (NvChad)
│   ├── core/               # Core utilities and keymaps
│   ├── configs/            # Plugin configurations
│   ├── plugins/            # Modular plugin definitions
│   └── options.lua         # Neovim options
├── scripts/                # Utility scripts
│   ├── tmux-sessionizer.sh # Quick tmux session management
│   ├── warp-ai-activate.sh # Warp AI integration
│   └── ...                 # Various utilities
├── my_snippets/            # Personal code snippets
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
- **Modern Tools**: Aliases for eza (ls), bat (cat), and other modern replacements
- **Git Abbreviations**: Quick git commands (gs, gd, gp, etc.)
- **FZF Integration**: Fuzzy finding for files, directories, and command history
- **Development Helpers**: Node.js, Python, and JavaScript specific commands
- **Custom Functions**: Package.json scripts runner, directory navigation, weather
- **Productivity**: Smart abbreviations for common development tasks

### Tmux
- **Modern Key Bindings**: Intuitive navigation and window management
- **Plugin System**: TPM (Tmux Plugin Manager) with useful plugins
- **Theme**: Catppuccin theme for beautiful appearance
- **Warp AI Integration**: Special bindings for Warp terminal AI features

### Neovim
- **NvChad Base**: Modern Neovim setup with performance optimizations
- **Modular Plugins**: Organized by category (LSP, editor, git, UI, completion)
- **Language Support**: LSP configurations for multiple languages
- **Plugin Management**: Lazy.nvim with optimized lazy loading
- **Key Features**: Telescope, Treesitter, Git integration, Copilot
- **Performance**: ~150ms startup time with lazy loading

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
- **Functions**: Fish functions are stored in `~/.config/fish/functions/`

## Notes on Unused Items

The following items exist in the repository but are not actively used:

### Commented Out in Brewfile
- **Network Tools**: bandwhich, wireshark
- **Java/JVM**: gradle
- **Database**: postgresql, mysql-client
- **System Monitoring**: glances, procs, ytop (using htop instead)
- **Novelty**: cmatrix, sl
- **Other**: macvim, liquidprompt, watchman

### Legacy Files
- **vimrc**: Not present (using Neovim exclusively)
- **zshrc**: Not present (using Fish shell exclusively)
- **Ubuntu support**: The ubuntu.sh installer exists but focus is on macOS

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

- [NvChad](https://github.com/NvChad/NvChad) for the Neovim configuration base
- [Homebrew](https://brew.sh/) for macOS package management
- [Fish Shell](https://fishshell.com/) for the friendly interactive shell
- [Tmux](https://github.com/tmux/tmux) for terminal multiplexing
- [Warp](https://www.warp.dev/) for the AI-powered terminal
- [Lazy.nvim](https://github.com/folke/lazy.nvim) for Neovim plugin management


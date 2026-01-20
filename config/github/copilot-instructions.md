# Dotfiles Repository - AI Coding Instructions

## Repository Architecture

This is a **personal macOS dotfiles repository** managed with **GNU Stow** for symlink management. The setup uses Homebrew for package management and follows a modular configuration approach.

### Core Structure
- **`install.sh`** - Main bootstrap script with interactive setup
- **`Brewfile`** - Homebrew packages and casks for complete environment
- **`bin/`** - Custom utility scripts (tmux session management, SSH key automation)
- **Configuration modules**: `zsh/`, `git/`, `tmux/`, `nvim/`, `starship/` - each contains dotfiles ready for Stow

## Key Development Patterns

### Stow-Based Configuration Management
Files are organized for GNU Stow symlink management:
```
zsh/.zshrc → ~/.zshrc
git/.gitconfig → ~/.gitconfig
starship/.config/starship.toml → ~/.config/starship.toml
```

When adding new configurations, create the full directory structure that mirrors the target location in `$HOME`.

### Installation Workflow
The `install.sh` script follows this pattern:
1. **Homebrew setup** - Install and configure with Apple Silicon support
2. **Package installation** - Process Brewfile with `brew bundle`
3. **Python/Node.js setup** - Configure uv-managed Python, install global npm packages
4. **Stow deployment** - Symlink specific modules: `stow -t "$HOME" zsh git starship`
5. **Shell configuration** - Set zsh as default shell

### Development Environment Focus
- **Python**: Uses `uv` as primary package manager with `direnv` for project environments
- **Git**: Multi-identity setup with conditional includes for different projects (`includeIf "gitdir:~/projects/worten/**"`)
- **Terminal**: tmux + Neovim workflow with custom session management via `bin/tat`
- **Prompt**: Starship with Catppuccin theme, shows Python venvs, Git status, command duration

## Important Utilities

### `bin/tat` - Tmux Session Manager
Creates project-specific tmux sessions with automatic Neovim splits:
- `tat --start` - Simple session from current directory
- `tat ~/projects` - Interactive project selection with Neovim split layout

### SSH Key Management
`bin/auto-add-ssh-keys.sh` automatically loads all SSH keys from `~/.ssh/id_*` into ssh-agent.

## Configuration Conventions

### Zsh Configuration (`.zshrc`)
- **Performance optimized** - Conditional completions, plugin caching
- **Homebrew plugin integration** - Sources plugins from `$(brew --prefix)/share/`
- **Development tool hooks** - direnv, uv, fzf auto-initialization
- **Aliases follow patterns**: `g*` for git, `uv*` for Python, `k` for kubectl

### Git Configuration
- **Conditional configs** for work vs personal projects
- **GPG signing enabled** with SSH format
- **Global excludes** via `.gitignore_global`
- **LFS integration** for large files

### Tmux Setup
- **Custom key bindings** - `Ctrl+A` prefix, vim-style pane navigation
- **Plugin ecosystem** - TPM with resurrect, continuum, sessionx
- **Catppuccin theming** with status modules for directory, time, calendar

## Key Commands & Workflows

### Bootstrap New Machine
```bash
./install.sh  # Interactive setup with confirmations
```

### Add New Configuration Module
1. Create directory structure: `mkdir -p newapp/.config/newapp`
2. Add config files: `touch newapp/.config/newapp/config.toml`
3. Deploy: `stow -t "$HOME" newapp`
4. Update `install.sh` stow packages array

### Update Packages
```bash
brew bundle install --verbose  # Install new Brewfile entries
brew bundle cleanup            # Remove packages not in Brewfile
```

### Development Shortcuts
- `py` → `uv run python` (Python execution)
- `uvr command` → `uv run command` (Run in uv environment)
- `tat` → Smart tmux session management
- `gcm "message"` → Quick git commit function

## External Dependencies

- **macOS specific** - Uses Homebrew, Apple Silicon optimizations
- **Rancher Desktop** for containers (alternative to Docker Desktop)
- **Font requirements** - Nerd fonts for proper starship/tmux display
- **AWS CLI integration** with SSO shortcuts

## File Editing Guidelines

- **Never edit symlinked files directly** - Edit source files in this repo, re-stow if needed
- **Zsh changes** require `exec zsh` or terminal restart
- **tmux changes** use `tmux source-file ~/.tmux.conf` or `prefix + R`
- **Keep machine-specific configs** in `.zshrc.local`, `.gitconfig.private` (not tracked)
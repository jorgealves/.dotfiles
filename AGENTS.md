# AGENTS.md

## Project Overview

This is a **macOS dotfiles repository** that provides automated development environment setup with a focus on:
- Python development (uv, poetry, multiple Python versions)
- Container development (Docker, Kubernetes tools)
- Cloud development (Azure CLI, Terraform)
- AI/ML development (AI agent skills, GitHub Copilot, OpenCode)
- Modern shell experience (Starship prompt, zsh enhancements)

## Setup Commands

```bash
# Full automated setup
./bootstrap.sh

# Alternative entry point
make run

# Check installation status
brew list | grep -E "(uv|poetry|kubectl)"

# Validate configuration
stow -n -v */ && echo "✅ All configs valid"

# Update environment
source ~/.zshrc && direnv reload
```

## Architecture

```
.dotfiles/
├── 🚀 bootstrap.sh              # Main installation orchestrator
├── 📦 Brewfile                  # ALL packages (read this first)
├── ⚙️ config/                   # Symlinked to $HOME via GNU Stow
│   ├── 🤖 agent_skills/         # Custom AI capabilities (submodule)
│   ├── 🤖 opencode/            # OpenCode AI assistant config
│   ├── 🐚 zsh/                 # Shell configuration
│   └── ⭐ starship/            # Shell prompt themes
├── 🔨 install/                 # Installation scripts (ORDERED)
│   ├── brew.sh → shell.sh → git.sh → dotfiles.sh → python.sh → skills.sh
└── 📚 lib/                     # Utility functions
    ├── logs.sh                 # log_info, log_error, log_success
    └── variables.sh            # Environment variables
```

## Development Workflow

### Before Making Changes
```bash
# ALWAYS validate first
stow -n -v */ 2>&1 | grep -i conflict

# Use existing logging
source lib/logs.sh
log_info "Starting task"
```

### Adding New Tools
1. Add to `Brewfile`
2. Create config in `config/<tool>/`
3. Add symlink in `install/dotfiles.sh`
4. Test with `stow -n -v <tool>`

### Python Environment Setup
```bash
# Check available versions
uv python list

# Create project environment
echo "python-version = '3.12'" > .python-version
direnv allow

# Validate
python --version && echo "✅ Ready"
```

## Code Style & Conventions

### Configuration Management
- **Use GNU Stow**: All configs go in `config/` and are symlinked
- **Never edit directly**: Don't modify `~/.zshrc`, use `config/zsh/.zshrc`
- **Test first**: Always run `stow -n -v */` before `stow -v */`

### Python Standards
- **Primary tool**: uv (fast package manager)
- **Supported versions**: 3.11, 3.12, 3.13
- **Environment management**: direnv for auto-activation
- **Default version**: 3.12

### Shell Configuration
- **Shell**: zsh with starship prompt
- **Auto-suggestions**: zsh-autosuggestions enabled
- **Syntax highlighting**: zsh-syntax-highlighting enabled

## Security Rules

### NEVER Commit These Files
```gitignore
*.local
.envrc.local
.env
.env.*
*.pem
*.key
*_rsa
.aws/credentials
```

### Secrets Management
- Store API keys in `.envrc.local` files (auto-gitignored)
- Use direnv for environment isolation
- Use SSH keys for Git authentication

## Testing & Validation

### Health Check Commands
```bash
# Core tools validation
command -v brew && echo "✅ Homebrew"
command -v uv && echo "✅ uv"
command -v stow && echo "✅ GNU Stow"

# Configuration validation
[ -f ~/.zshrc ] && echo "✅ zsh configured"
[ -f ~/.gitconfig ] && echo "✅ git configured"

# Agent skills
npx skills list && echo "✅ Skills available"
ls -la config/agent_skills/ && echo "✅ Custom skills"
```

### Debugging Common Issues
```bash
# Stow conflicts
stow -D -v */ && stow -v */

# Homebrew issues
brew doctor && brew update && brew upgrade

# Python environment problems
direnv reload && uv python list
```

## Agent Skills System

### Official Skills (npm/npx)
```bash
npx skills add python-helper
npx skills list
npx skills update
```

### Custom Skills (config/agent_skills/)
Specialized skills for:
- **Python**: async-advisor, type-hints-converter, security-scanner
- **Security**: secret-leak-detector, pii-sanitizer, compliance-auditors
- **DevOps**: k8s-resource-optimizer, database-migration-checker
- **Code Quality**: code-review-assistant, refactoring-suggester

Usage:
```bash
npx skills use python-security-scanner scan .
npx skills use code-review-assistant review src/
```

## Maintenance Commands

```bash
# Weekly updates
brew update && brew upgrade
uv self update
npx skills update
stow -R -v */

# Cleanup
brew cleanup
uv cache clean
```

## Emergency Recovery

### Complete Reset (Nuclear Option)
```bash
cd ~/.dotfiles
stow -D -v */              # Remove all symlinks
git checkout HEAD -- config/  # Reset configs
./bootstrap.sh             # Reinstall everything
```

### Partial Fixes
```bash
# Fix only Stow issues
stow -R -v */

# Fix only Python
uv self update && direnv reload

# Fix only Homebrew
brew doctor && brew update && brew upgrade
```

## Important Notes

- **Installation Order**: The 6 install scripts must run in order (brew → shell → git → dotfiles → python → skills)
- **macOS Only**: This setup is specifically designed for macOS
- **GNU Stow Required**: All configuration management relies on GNU Stow for symlinks
- **Python Default**: Default Python version is 3.12, but 3.11 and 3.13 are also available
- **Agent Integration**: Works with OpenCode, GitHub Copilot, Cursor, and other AI coding tools

## Key Tools Installed

### Core Development
- **Python**: uv, poetry, pipx, direnv
- **Git**: git, git-lfs, gh (GitHub CLI)
- **Containers**: docker-desktop, kubectl, k9s, helm
- **Cloud**: azure-cli, kubelogin

### Modern CLI
- **Shell**: zsh, starship, fzf
- **Search**: ripgrep, fd
- **File Tools**: bat, eza, jq, yq
- **TUI**: lazygit, lazydocker, k9s

### AI Tools
- **Assistants**: opencode, copilot-cli, ollama
- **Skills**: Custom skills via git submodule + official via npm

## File Structure Details

| Path | Purpose | Agent Action |
|------|---------|--------------|
| `Brewfile` | All package definitions | Read before adding tools |
| `config/*/` | Tool configurations | Modify instead of `~/.*` files |
| `lib/logs.sh` | Logging functions | Use for consistent output |
| `install/*.sh` | Setup scripts | Understand before modifying |
| `.envrc.local` | Local secrets | Create for API keys (gitignored) |

## Success Indicators

✅ **Installation Complete When**:
- All 6 install scripts complete without errors
- `stow -n -v */` shows no conflicts  
- `python --version` shows 3.12 (or desired version)
- `gh auth status` shows authenticated
- Starship prompt is active in terminal

✅ **Environment Ready When**:
- Python environments auto-activate in projects
- Custom agent skills are accessible
- All symlinks resolve correctly: `ls -la ~ | grep "\.dotfiles"`
- Container tools work: `docker version`, `kubectl version`

---

**Last Updated**: 2025-01-21  
**Format**: AGENTS.md v2.0 Standard  
**Compatible With**: OpenCode, GitHub Copilot, Cursor, Zed, Claude Code, and other AI coding agents

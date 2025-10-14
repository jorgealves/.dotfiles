# 🚀 company Development Environment

Automated dotfiles setup for macOS development at company using GNU Stow.

## ✨ Features

- 🍺 **Homebrew** package management via Brewfile
- 🐍 **Python** development with uv and multiple versions
- 🐳 **Docker** via Rancher Desktop
- ☁️ **AWS CLI** with ECR helper
- 📦 **Node.js** with npm
- 🎨 **Beautiful shell** with Starship prompt
- 🔧 **GNU Stow** for symlink management
- ⚡ **Fast startup** (~50ms with optimizations)

## 📋 What Gets Installed

### Core Tools
- **uv** - Fast Python package manager
- **direnv** - Per-directory environments
- **Git** + Git LFS
- **AWS CLI** + ECR credential helper
- **Docker** (Rancher Desktop)
- **Node.js** + npm

### Shell Enhancements
- **Starship** - Modern prompt
- **zsh-autosuggestions** - Fish-like suggestions
- **zsh-syntax-highlighting** - Syntax highlighting
- **fzf** - Fuzzy finder

### Developer Utilities
- **jq/yq** - JSON/YAML processors
- **ripgrep** - Fast grep
- **bat** - Better cat
- **httpie** - User-friendly HTTP client
- **tree** - Directory visualization

## 🚀 Quick Start

### New Machine Setup

```bash
# 1. Clone this repository
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles

# 2. Run the initialization script
cd ~/dotfiles
chmod +x init.sh
./init.sh
```

That's it! The script will:
- ✅ Install Homebrew
- ✅ Install all packages from Brewfile
- ✅ Setup Python (3.11, 3.12, 3.13)
- ✅ Setup Node.js
- ✅ Backup existing configs
- ✅ Symlink dotfiles with Stow
- ✅ Configure Git and shell

### Manual Setup (if you prefer step-by-step)

```bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Clone dotfiles
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Install packages
brew bundle install

# Install Python versions
uv python install 3.11 3.12 3.13

# Symlink configs with Stow
stow zsh git starship

# Reload shell
exec zsh
```

## 📁 Repository Structure

```
~/dotfiles/
├── README.md                  # This file
├── Brewfile                   # Homebrew packages
├── init.sh                    # Main setup script
│
├── zsh/                       # Zsh configuration
│   └── .zshrc                 # Shell config
│
├── git/                       # Git configuration
│   └── .gitconfig             # Git config
│
├── starship/                  # Starship prompt
│   └── .config/
│       └── starship.toml      # Prompt config
│
├── scripts/                   # Helper scripts
│   ├── install-homebrew.sh
│   ├── install-packages.sh
│   ├── setup-python.sh
│   └── update.sh
│
└── docs/                      # Documentation
    ├── SETUP.md
    └── TROUBLESHOOTING.md
```

## 🔧 Post-Installation Steps

### 1. Configure Git

```bash
# Update with your information
git config --global user.name "Your Name"
git config --global user.email "your.email@company.com"
```

### 2. Setup SSH Keys

```bash
# Generate SSH key
ssh-keygen -t ed25519 -C "your.email@company.com"

# Copy to clipboard
cat ~/.ssh/id_ed25519.pub | pbcopy

# Add to GitHub: https://github.com/settings/keys
```

### 3. Configure AWS

```bash
# Interactive setup
aws configure

# Or use SSO
aws configure sso
```

### 4. Login to Docker/ECR

```bash
# Start Rancher Desktop first, then:
aws ecr get-login-password --region us-east-1 | \
  docker login --username AWS --password-stdin \
  <account>.dkr.ecr.us-east-1.amazonaws.com
```

### 5. Install npm global packages

```bash
npm install -g less
```

## 🔄 Updating

### Update packages

```bash
cd ~/dotfiles
git pull
brew update && brew upgrade
brew bundle install  # Install any new packages
```

### Update dotfiles

```bash
# Edit files in ~/dotfiles/
vim ~/dotfiles/zsh/.zshrc

# Changes are automatically reflected (symlinks!)
# Commit when ready
cd ~/dotfiles
git add .
git commit -m "Update zsh config"
git push
```

### Re-stow after changes

```bash
cd ~/dotfiles
stow -R zsh git starship
```

## 📝 Usage Examples

### Python Projects

```bash
# Navigate to project
cd ~/Projects/my-project

# Setup direnv
echo "layout python-uv" > .envrc
direnv allow

# Install dependencies
uv sync

# Run commands
uv run python script.py
uv run pytest
```

### Adding New Dotfiles

Want to add nvim configuration?

```bash
# Create stow package
mkdir -p ~/dotfiles/nvim/.config/nvim

# Add your config
cp ~/.config/nvim/init.lua ~/dotfiles/nvim/.config/nvim/

# Stow it
cd ~/dotfiles
stow nvim

# Commit
git add nvim
git commit -m "Add nvim config"
```

## 🛠️ Customization

### Machine-Specific Settings

Create local config files (not tracked in git):

```bash
# Zsh local config
touch ~/.zshrc.local

# Git local config
touch ~/.gitconfig.local

# Add to .gitignore
echo "*.local" >> .gitignore
```

Example `~/.zshrc.local`:
```bash
# Machine-specific aliases
alias work-vpn='sudo openconnect vpn.company.com'

# Machine-specific environment variables
export CUSTOM_PATH="/usr/local/custom/bin"
```

### Add More Packages

```bash
# Install new package
brew install neovim

# Add to Brewfile
echo 'brew "neovim"' >> ~/dotfiles/Brewfile

# Commit
git add Brewfile
git commit -m "Add neovim"
```

## 🐛 Troubleshooting

### Slow shell startup

```bash
# Profile startup time
time zsh -i -c exit

# Enable profiling in .zshrc
# Uncomment: zmodload zsh/zprof
# Add at end: zprof
```

### Stow conflicts

```bash
# See what would happen (dry run)
stow -n zsh

# Force restow
stow -R zsh

# If file exists, backup first
mv ~/.zshrc ~/.zshrc.backup
stow zsh
```

### Homebrew issues

```bash
# Check health
brew doctor

# Fix permissions
sudo chown -R $(whoami) $(brew --prefix)/*

# Update Homebrew
brew update
```

### Python version issues

```bash
# List installed versions
uv python list

# Install specific version
uv python install 3.12

# Set default
uv python pin 3.12
```

## 📚 Useful Commands

```bash
# Check shell startup time
time zsh -i -c exit

# List installed Homebrew packages
brew list

# Check what's in Brewfile
brew bundle list

# Clean up old packages
brew bundle cleanup

# Update everything
brew update && brew upgrade && brew cleanup

# Reload shell
exec zsh

# Check direnv status
direnv status
```

## 🔐 Security Notes

- ⚠️ **Never commit secrets** - Use `.envrc.local` for sensitive data
- ⚠️ **Review before committing** - Check for API keys, tokens, passwords
- ✅ **Use SSH keys** - Not HTTPS passwords for Git
- ✅ **Use AWS SSO** - Instead of long-term credentials

Files to keep out of git:
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

## 📖 Resources

- [GNU Stow Manual](https://www.gnu.org/software/stow/manual/)
- [Starship Configuration](https://starship.rs/config/)
- [uv Documentation](https://github.com/astral-sh/uv)
- [direnv Documentation](https://direnv.net/)
- [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle)

## 🤝 Contributing

This is a personal dotfiles repo, but if you're a company colleague and want to share improvements:

1. Fork this repo
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📄 License

MIT License - Feel free to use and modify

## 🙏 Acknowledgments

- Inspired by countless dotfiles repos in the community
- company engineering team for the development environment guidelines

---

**Note**: This setup is optimized for company's development environment. Adjust as needed for your workflow.

Last updated: October 2025
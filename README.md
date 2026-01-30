# 🚀 Development Environment

Automated dotfiles setup for macOS.

## ✨ Features

- 🍺 **Homebrew** package management via Brewfile
- 🐍 **Python** development with uv and multiple versions
- 🐳 **Docker** via Docker Desktop
- ☁️ **Azure CLI**
- 📦 **Node.js** with npm
- 🎨 **Beautiful shell** with Starship prompt
- 🔧 **GNU Stow** for symlink management
- 🤖 **Agent Skills** management with Vercel ecosystem integration

## 🤖 Agent Skills Management

This setup includes a hybrid agent skills management system that combines:
- **Official Skills**: From Vercel's agent skills ecosystem
- **Custom Skills**: Your personal collection of agent capabilities

## 📋 What Gets Installed

### Core Tools
- **uv** - Fast Python package manager
- **direnv** - Per-directory environments
- **Git** + Git LFS
- **Azure CLI** - Cloud management
- **Docker** (Docker Desktop)
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

### AI Agent Tools
- **OpenCode** - AI coding assistant
- **GitHub Copilot CLI** - AI pair programmer
- **Agent Skills** - Hybrid skills management (Vercel ecosystem + custom skills)

## 🚀 Quick Start

### New Machine Setup

```bash
# 1. Clone this repository
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles

# 2. Run the initialization script
cd ~/dotfiles
chmod +x bootstrap.sh
./bootstrap.sh
```

That's it! The script will:
- ✅ Install Homebrew
- ✅ Install all packages from Brewfile
- ✅ Setup Python (3.11, 3.12, 3.13)
- ✅ Setup Node.js
- ✅ Setup agent skills management
- ✅ Symlink dotfiles with Stow
- ✅ Configure Git and shell

## 🔐 Security Notes

- ⚠️ **Never commit secrets** - Use `.envrc.local` for sensitive data
- ⚠️ **Review before committing** - Check for API keys, tokens, passwords
- ✅ **Use SSH keys** - Not HTTPS passwords for Git

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

Last updated: January 2026
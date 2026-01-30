# 🤖 AGENTS.md - AI Agent Documentation

This document provides comprehensive information about this dotfiles repository for AI agents to understand its structure, functionality, and purpose.

## 📋 Repository Overview

This is a **macOS dotfiles repository** that provides automated development environment setup with a focus on:
- **Python development** (uv, poetry, multiple Python versions)
- **Container development** (Docker, Kubernetes tools)
- **Cloud development** (Azure CLI, Terraform)
- **AI/ML development** (AI agent skills, GitHub Copilot, OpenCode)
- **Modern shell experience** (Starship prompt, zsh enhancements)

## 🏗️ Repository Structure

```
.dotfiles/
├── bootstrap.sh           # Main installation orchestrator
├── Makefile              # Simple make targets
├── Brewfile              # Homebrew package definitions
├── README.md             # User documentation
├── config/               # Configuration files for tools
│   ├── agent_skills/     # AI agent skills (git submodule)
│   ├── cursor/          # Cursor IDE configuration
│   ├── git/             # Git configuration
│   ├── github/          # GitHub CLI configuration
│   ├── starship/        # Starship prompt configuration
│   ├── zed/             # Zed editor configuration
│   └── zsh/             # Zsh shell configuration
├── install/             # Modular installation scripts
│   ├── brew.sh          # Homebrew and package installation
│   ├── dotfiles.sh      # Symlink management with GNU Stow
│   ├── git.sh           # Git configuration setup
│   ├── python.sh        # Python environment setup
│   ├── shell.sh         # Shell configuration
│   └── skills.sh        # AI agent skills installation
└── lib/                 # Utility libraries
    ├── logs.sh          # Colored logging functions
    ├── utils.sh         # Utility functions
    └── variables.sh     # Environment variables
```

## 🚀 Installation Process

### Entry Points
- **Primary**: `./bootstrap.sh` - Full automated setup
- **Alternative**: `make run` - Wrapper around bootstrap.sh

### Installation Flow
The bootstrap process follows this sequence:

1. **`install/brew.sh`** - Install Homebrew and all packages from Brewfile
2. **`install/shell.sh`** - Configure shell environment (zsh, starship, etc.)
3. **`install/git.sh`** - Set up Git configuration
4. **`install/dotfiles.sh`** - Create symlinks using GNU Stow
5. **`install/python.sh`** - Set up Python environments (3.11, 3.12, 3.13)
6. **`install/skills.sh`** - Install AI agent skills

### Key Technologies Used
- **GNU Stow**: Symlink management for dotfiles
- **Homebrew**: Package management via Brewfile
- **uv**: Fast Python package manager
- **direnv**: Directory-based environment variables
- **Starship**: Cross-shell prompt customization

## 🤖 AI Agent Skills System

This repository includes a **hybrid agent skills management system** that combines:

### Official Skills (Vercel Ecosystem)
- Integrated via `npx skills add` command
- Global installation for OpenCode and GitHub Copilot agents
- Provides standard AI development capabilities

### Custom Skills (Git Submodule)
Located in `config/agent_skills/`, includes specialized skills for:

**Development & Code Quality**:
- `code-review-assistant` - Automated code review
- `refactoring-suggester` - Code refactoring recommendations
- `technical-debt-visualizer` - Technical debt analysis
- `documentation-generator` - Auto-documentation

**Python Ecosystem**:
- `python-async-advisor` - Async/await optimization
- `python-dependency-resolver` - Dependency management
- `python-performance-profiler` - Performance analysis
- `python-security-scanner` - Security vulnerability scanning
- `python-type-hints-converter` - Type hint automation
- `pytest-optimizer` - Test optimization
- `poetry-uv-advisor` - Package manager guidance

**Security & Compliance**:
- `secret-leak-detector` - Secret detection in code
- `pii-sanitizer` - PII data sanitization
- `prompt-injection-scanner` - AI prompt security
- `gdpr-ccpa-privacy-auditor` - Privacy compliance
- `hipaa-compliance-guard` - HIPAA compliance checking
- `license-compliance-auditor` - License compliance

**Infrastructure & DevOps**:
- `k8s-resource-optimizer` - Kubernetes optimization
- `database-migration-integrity-checker` - DB migration safety

**Educational & Training**:
- `concept-mastery-validator` - Learning assessment
- `module-learning-path-generator` - Educational pathways
- `pedagogical-code-grader` - Code assessment

## 📦 Installed Tools & Packages

### Core Development Tools
```bash
# Python ecosystem
uv                    # Fast Python package manager
poetry                # Python dependency management
pipx                  # Install Python applications
direnv                # Environment management

# Version control
git                   # Version control
git-lfs               # Large file storage
gh                    # GitHub CLI

# Container & Cloud
docker-desktop        # Container runtime
kubectl, k9s          # Kubernetes tools
azure-cli             # Azure cloud CLI
```

### Shell & Terminal Enhancements
```bash
starship              # Modern shell prompt
zsh-autosuggestions   # Fish-like suggestions
zsh-syntax-highlighting # Syntax highlighting
fzf                   # Fuzzy finder
ripgrep, bat, eza     # Modern CLI alternatives
lazygit, lazydocker   # TUI tools
```

### AI & Development Tools
```bash
opencode              # AI coding assistant
copilot-cli           # GitHub Copilot CLI
# Custom agent skills via npm/npx integration
```

## 🔧 Configuration Management

### Dotfiles Strategy
- **GNU Stow**: Creates symlinks from `config/` to `$HOME`
- **Modular configs**: Each tool has its own subdirectory
- **Version controlled**: All configurations are tracked in git

### Environment Variables
- **direnv**: Per-directory environment management
- **Security**: `.envrc.local` for sensitive data (gitignored)
- **Global vars**: Defined in `lib/variables.sh`

## 🚨 Security Considerations

### Secrets Management
```gitignore
# Never commit these files
*.local
.envrc.local
.env
.env.*
*.pem
*.key
*_rsa
.aws/credentials
```

### Best Practices
- Use SSH keys for Git authentication
- Store API keys in `.envrc.local` files
- Use direnv for environment isolation
- Regular security scanning with included tools

## 🔄 Maintenance & Updates

### Regular Maintenance Commands
```bash
# Update Homebrew packages
brew update && brew upgrade

# Update Python environments
uv self update

# Update agent skills
npx skills update

# Re-apply dotfiles
cd ~/.dotfiles && stow -R -v */
```

### Adding New Tools
1. Add to `Brewfile` for Homebrew packages
2. Create config in `config/<tool>/`
3. Add symlink setup to `install/dotfiles.sh`
4. Update documentation

## 🎯 Use Cases for AI Agents

This environment is optimized for AI agents working on:

1. **Python Development**: Full ecosystem support with uv, poetry, multiple Python versions
2. **Cloud-Native Development**: Kubernetes, Docker, Azure tools
3. **Code Quality**: Automated review, refactoring, security scanning
4. **Documentation**: Auto-generation and maintenance
5. **Educational Content**: Code assessment and learning path generation
6. **Compliance**: Security, privacy, and license compliance checking

## 📚 Key Files for AI Agents

When working with this repository, AI agents should be aware of:

- **`Brewfile`** - All installed packages and their purposes
- **`config/*/`** - Tool-specific configurations
- **`lib/logs.sh`** - Logging utilities for consistent output
- **`config/agent_skills/`** - Custom AI agent capabilities
- **Installation scripts** in `install/` - Understanding setup process

## 🤝 Integration Guidelines

For AI agents integrating with this environment:

1. **Respect the structure** - Follow the modular organization
2. **Use existing utilities** - Leverage `lib/` functions for consistency
3. **Follow security practices** - Never commit secrets
4. **Test changes** - Verify installations work across clean environments
5. **Update documentation** - Keep README.md and this file current

## 🔍 Troubleshooting

### Common Issues
- **Stow conflicts**: Use `stow -R` to restow configurations
- **Homebrew permissions**: Run `brew doctor` for diagnostics
- **Python environments**: Use `uv python list` to check installations
- **Agent skills**: Check `npx skills list` for installed skills

### Debugging
All scripts use comprehensive logging via `lib/logs.sh` with:
- **Color-coded output** - Green (success), Yellow (info), Red (error)
- **Timestamps** - All log entries include timestamps
- **Script identification** - Shows which script generated each log

## 🛠️ Development Workflow

### For AI Agents Working on This Repository

1. **Understanding the Environment**: 
   - All installations are managed via Brewfile
   - Configurations are symlinked via GNU Stow
   - Custom agent skills extend AI capabilities

2. **Making Changes**:
   - Test changes in isolated directories first
   - Use existing logging functions from `lib/logs.sh`
   - Follow the modular script architecture

3. **Adding New Features**:
   - Create new install scripts in `install/` directory
   - Add corresponding configurations in `config/`
   - Update the main `bootstrap.sh` orchestrator
   - Document changes in README.md

4. **Working with Agent Skills**:
   - Custom skills are in the `config/agent_skills/` submodule
   - Official skills are managed via npm/npx
   - Test skills integration with OpenCode and GitHub Copilot

This environment provides a comprehensive, secure, and maintainable development setup optimized for modern Python development with AI integration capabilities.

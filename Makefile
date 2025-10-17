# Dotfiles Makefile
# Common tasks for managing dotfiles

.PHONY: help install update backup clean check health

# Default target
help:
	@echo "Available targets:"
	@echo "  install    - Run full installation (Homebrew + packages + stow)"
	@echo "  update     - Update all packages and configurations"
	@echo "  backup     - Backup existing configurations before changes"
	@echo "  check      - Check system health and configuration"
	@echo "  health     - Run health check and show status"

# Full installation
install:
	@echo "🚀 Starting full installation..."
	@chmod +x install.sh
	@./install.sh
	@make update
# Update packages and configurations
update:
	@echo "📦 Updating packages..."
	@brew update && brew upgrade
	@brew bundle upgrade
	@brew cleanup
	@brew bundle cleanup --force
	@brew bundle check
	@brew doctor
	@echo "✅ Update complete!"


# Backup existing configurations
backup:
	@echo "💾 Creating backup of existing configurations..."
	@mkdir -p backups/$(shell date +%Y%m%d_%H%M%S)
	@BACKUP_DIR="backups/$(shell date +%Y%m%d_%H%M%S)"; \
	[ -f ~/.zshrc ] && cp ~/.zshrc $$BACKUP_DIR/.zshrc.bak || true; \
	[ -f ~/.gitconfig ] && cp ~/.gitconfig $$BACKUP_DIR/.gitconfig.bak || true; \
	[ -f ~/.config/starship.toml ] && cp ~/.config/starship.toml $$BACKUP_DIR/starship.toml.bak || true; \
	[ -f ~/.tmux.conf ] && cp ~/.tmux.conf $$BACKUP_DIR/.tmux.conf.bak || true; \
	echo "✅ Backup created in $$BACKUP_DIR"

# Clean up old packages and caches
clean:
	@echo "🧹 Cleaning up..."
	@brew cleanup
	@brew bundle cleanup --force
	@echo "✅ Cleanup complete!"

# Check system health
check:
	@echo "🔍 Checking system health..."
	@echo "Homebrew status:"
	@brew doctor || true
	@echo ""
	@echo "Installed packages:"
	@brew list --formula | wc -l | xargs echo "Formulas:"
	@brew list --cask | wc -l | xargs echo "Casks:"
	@echo ""
	@echo "Configuration files:"
	@[ -f ~/.zshrc ] && echo "✅ .zshrc exists" || echo "❌ .zshrc missing"
	@[ -f ~/.gitconfig ] && echo "✅ .gitconfig exists" || echo "❌ .gitconfig missing"
	@[ -f ~/.config/starship.toml ] && echo "✅ starship.toml exists" || echo "❌ starship.toml missing"
	@[ -f ~/.tmux.conf ] && echo "✅ .tmux.conf exists" || echo "❌ .tmux.conf missing"

# Health check with detailed status
health: check
	@echo ""
	@echo "🔧 Tool versions:"
	@command -v git >/dev/null && git --version || echo "❌ Git not found"
	@command -v zsh >/dev/null && zsh --version || echo "❌ Zsh not found"
	@command -v tmux >/dev/null && tmux -V || echo "❌ Tmux not found"
	@command -v starship >/dev/null && starship --version || echo "❌ Starship not found"
	@command -v brew >/dev/null && brew --version | head -1 || echo "❌ Homebrew not found"
	@command -v uv >/dev/null && uv --version || echo "❌ uv not found"
	@command -v node >/dev/null && node --version || echo "❌ Node.js not found"
	@echo ""
	@echo "📊 Shell startup time:"
	@time zsh -i -c exit 2>&1 | grep real || echo "Could not measure startup time"

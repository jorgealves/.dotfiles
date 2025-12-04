#!/bin/bash
# init.sh - Complete dotfiles initialization script
# Usage: ./init.sh

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get the directory where this script lives
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Logging functions
log_info() {
    echo -e "${BLUE}ℹ ${NC} $1"
}

log_success() {
    echo -e "${GREEN}✓${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

log_error() {
    echo -e "${RED}✗${NC} $1"
}

print_header() {
    echo ""
    echo -e "${BLUE}================================================${NC}"
    echo -e "${BLUE}  $1${NC}"
    echo -e "${BLUE}================================================${NC}"
    echo ""
}

# Confirmation prompt
confirm() {
    read -p "$(echo -e ${YELLOW}▶${NC}) $1 (y/N): " -n 1 -r
    echo
    [[ $REPLY =~ ^[Yy]$ ]]
}

# Check if running on macOS
check_os() {
    if [[ "$OSTYPE" != "darwin"* ]]; then
        log_error "This script is designed for macOS only"
        exit 1
    fi
}

# Install Homebrew
install_homebrew() {
    print_header "Installing Homebrew"

    if command -v brew &> /dev/null; then
        log_success "Homebrew already installed"
        brew --version
    else
        log_info "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        # Add to PATH for Apple Silicon
        if [[ $(uname -m) == "arm64" ]]; then
            log_info "Adding Homebrew to PATH (Apple Silicon)"
            echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi

        log_success "Homebrew installed successfully"
    fi
}

# Install packages from Brewfile
install_packages() {
    print_header "Installing Packages from Brewfile"

    if [ ! -f "$DOTFILES_DIR/Brewfile" ]; then
        log_error "Brewfile not found at $DOTFILES_DIR/Brewfile"
        exit 1
    fi

    log_info "Installing packages..."
    cd "$DOTFILES_DIR"
    brew bundle install --verbose

    log_success "All packages installed"
}

# Setup Python environments
setup_python() {
    print_header "Setting up Python Environments"

    log_info "Installing Python versions with uv..."
    uv python install 3.11 3.12 3.13 3.14

    log_info "Setting default Python version to 3.14..."
    uv python pin 3.14

    log_success "Python setup complete"
    uv python list
}

# Setup Node.js global packages
setup_node() {
    print_header "Setting up Node.js"

    log_info "Installing global npm packages..."
    npm install -g less

    log_success "Node.js setup complete"
}

# Setup Git configuration
setup_git() {
    print_header "Setting up Git"

    # Git LFS
    log_info "Initializing Git LFS..."
    git lfs install

    # Check if git config already set
    if git config --global user.email &> /dev/null; then
        log_success "Git user already configured"
        log_info "Current config:"
        echo "  Name: $(git config --global user.name)"
        echo "  Email: $(git config --global user.email)"
    else
        log_warning "Git user not configured"
        echo ""
        # read -p "Enter your name for Git: " git_name
        # read -p "Enter your email for Git: " git_email

        # git config --global user.name "$git_name"
        # git config --global user.email "$git_email"

        # log_success "Git configured successfully"
    fi
}


# Setup dotfiles with Stow
setup_stow() {
    print_header "Setting up Dotfiles with GNU Stow"

    cd "$DOTFILES_DIR"

    # List available stow packages
    log_info "Available configurations:"
    for dir in */; do
        if [ -d "$dir" ] && [ "$dir" != "scripts/" ] && [ "$dir" != "docs/" ]; then
            echo "  - ${dir%/}"
        fi
    done

    echo ""

    # Stow each package
    local packages=("zsh" "git" "starship", "cursor")

    for package in "${packages[@]}"; do
        if [ -d "$package" ]; then
            log_info "Stowing $package..."
            stow --adopt -v -t "$HOME" "$package" 2>&1 | grep -v "BUG in find_stowed_path" || true
            log_success "$package configured"
        else
            log_warning "Package '$package' not found, skipping"
        fi
    done
}

# Setup shell environment
setup_shell() {
    print_header "Setting up Shell Environment"

    # Source the new .zshrc to verify
    log_info "Shell configuration installed via Stow"

    # Check if zsh is default shell
    if [[ "$SHELL" != *"zsh"* ]]; then
        log_warning "Current shell is not zsh: $SHELL"
        if confirm "Set zsh as default shell?"; then
            chsh -s $(which zsh)
            log_success "Default shell changed to zsh (restart terminal to apply)"
        fi
    else
        log_success "Zsh is already the default shell"
    fi
}



# Verify Docker/Rancher Desktop
verify_docker() {
    print_header "Verifying Docker Setup"

    log_info "Checking Rancher Desktop..."
    if [ -d "/Applications/Rancher Desktop.app" ]; then
        log_success "Rancher Desktop installed"
        log_warning "Please start Rancher Desktop manually and configure it"
        log_info "After starting, verify with: docker ps"
    else
        log_warning "Rancher Desktop not found"
        log_info "Install it manually or add 'cask \"rancher-desktop\"' to Brewfile"
    fi
}

# Print next steps
print_next_steps() {
    print_header "Setup Complete! 🎉"

    cat << EOF
${GREEN}✓${NC} Homebrew and packages installed
${GREEN}✓${NC} Python environments configured
${GREEN}✓${NC} Node.js and npm packages installed
${GREEN}✓${NC} Dotfiles symlinked with Stow
${GREEN}✓${NC} Shell environment configured

${YELLOW}Next Steps:${NC}

1. ${BLUE}Restart your terminal${NC} or run:
   ${YELLOW}exec zsh${NC}

${GREEN}Happy coding! 🚀${NC}
EOF
}

# Main execution
main() {
    clear

    cat << "EOF"
    ____        __  _____ __
   / __ \____  / /_/ __(_) /__  _____
  / / / / __ \/ __/ /_/ / / _ \/ ___/
 / /_/ / /_/ / /_/ __/ / /  __(__  )
/_____/\____/\__/_/ /_/_/\___/____/

  Automated Setup for Development
EOF

    echo ""
    log_info "Starting initialization at: $(date)"
    log_info "Dotfiles directory: $DOTFILES_DIR"
    echo ""

    # Check prerequisites
    check_os

    # Ask for confirmation
    if ! confirm "This will install Homebrew, packages, and configure your system. Continue?"; then
        log_warning "Setup cancelled"
        exit 0
    fi

    # Run setup steps
    install_homebrew
    install_packages
    setup_python
    setup_node
    setup_git
    setup_stow
    setup_shell
    verify_docker

    # Finish
    print_next_steps
}

# Run main function
main "$@"

# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

macOS dotfiles with automated development environment setup. Configurations are managed via **GNU Stow** — all configs live in `config/<tool>/` and are symlinked to `$HOME`. Never edit files directly in `~/.zshrc` etc.; edit `config/zsh/.config/zsh/.zshrc` instead.

## Key Commands

```bash
# Full installation
./bootstrap.sh        # or: make run

# Validate (dry-run stow, check bash syntax)
make check

# Security checks (gitleaks, shellcheck, shfmt)
make security

# Check for stow conflicts before applying
stow -n -v -d config -t "$HOME" zsh starship git opencode zed 2>&1 | grep -i conflict

# Apply stow configs
stow -R -v -d config -t "$HOME" zsh starship git opencode zed
```

Shell scripts are linted with `shellcheck -x` and formatted with `shfmt -i 2 -ci -w` (2-space indent, compact if).

## Architecture

**Installation order is mandatory** — the 6 scripts in `install/` must run sequentially:
`brew.sh → shell.sh → git.sh → dotfiles.sh → python.sh → ai.sh`

`bootstrap.sh` orchestrates this. `lib/logs.sh` provides `log_info`, `log_success`, `log_error`, `log_warning` — use these in all shell scripts.

**Stowed tools:** `zsh`, `starship`, `git`, `zed`, `opencode` (aerospace is commented out).

**Python:** Managed via `uv`. Default version is 3.14; 3.12 and 3.13 also installed. Use `direnv` for per-project auto-activation.

**Packages:** Everything is in `Brewfile`. Read it before adding new tools. Adding a new tool means: add to `Brewfile`, create `config/<tool>/`, add stow entry in `install/dotfiles.sh`.

## Security

- Never commit: `*.local`, `.envrc.local`, `.env*`, `*.pem`, `*.key`, `*_rsa`
- API keys go in `.envrc.local` (gitignored)
- Git identity goes in `~/.gitconfig.private` (gitignored, sourced conditionally for `~/projects/`)
- Pre-commit hooks run gitleaks on every commit

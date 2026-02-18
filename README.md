# dotfiles

Automated macOS development environment setup.

## Install

```bash
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./bootstrap.sh
```

## Validate

```bash
make check
```

## What's included

- Python (uv, poetry, 3.12/3.13/3.14)
- Node.js + npm
- Docker Desktop
- Azure CLI
- Git + GitHub CLI
- Shell enhancements (starship, zsh plugins)
- AI tools (OpenCode, Copilot CLI, agent skills)
- CLI utilities (ripgrep, bat, fzf, jq)

## Security

Never commit secrets.

- Store local credentials in `.envrc.local` (gitignored).
- Keep private Git identity in `~/.gitconfig.private`.
- Follow the policy in [`SECURITY.md`](SECURITY.md).

## Pre-commit Checks

```bash
pre-commit install
make security
```

## Details

See [AGENTS.md](AGENTS.md) for comprehensive documentation.

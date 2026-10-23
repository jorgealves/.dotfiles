# dotfiles

A macOS development environment managed by Homebrew and `mise bootstrap`.

The code in `config/mise/config.toml` is the source of truth for tools,
packages, configurations linked into `$HOME`, and bootstrap preferences.

## Prerequisite

Homebrew must be installed and available on `PATH`. When mise is absent,
`bootstrap.sh` installs it directly with `brew install mise`; the current
bootstrap flow does not use the `Brewfile`. All remaining packages are
declared in the mise configuration.

## Installation

The clone path is part of the current configuration. Clone the repository to
`~/projects/.dotfiles`:

```bash
git clone <repository-url> ~/projects/.dotfiles
cd ~/projects/.dotfiles
./bootstrap.sh
```

The bootstrap installs mise when necessary, runs
`mise bootstrap --update --force-dotfiles --prompt-secrets`, upgrades managed
tools, prunes unused packages, and opens the configured initial applications.
It changes packages and files on the machine, and may request secrets.

## Inspecting the plan

```bash
mise bootstrap status
mise bootstrap plan
```

These are the diagnostic commands the bootstrap runs before applying changes.

## What is managed

- Runtimes: Python 3.12, 3.13, and 3.14; Node.js; Go; and Rust.
- Development and terminal tools: Git, Git LFS, GitHub CLI, uv, Poetry,
  Kubernetes tools, Docker Desktop, Neovim, tmux, and shell utilities.
- Applications and configuration: zsh, Starship, mise, Git, SSH, OpenCode,
  Neovim, Zed, and Visual Studio Code.

The exact list, including casks, is in
[`config/mise/config.toml`](config/mise/config.toml). Commented entries in
that file are not part of the installation.

## Agent skills

Repository-owned skills live in `agents/skills/<name>/SKILL.md` and are
versioned with this repository. `config/agents/skills` lists additional public
skill sources. To add machine-specific private sources, create the ignored
`config/agents/skills.local` file with one local directory or authenticated Git
source per line; blank lines and lines beginning with `#` are ignored. Keep
credentials in Git's credential helper or SSH agent, not in the source list.

The Skills CLI installs skills globally for Codex into `~/.agents/skills`;
OpenCode also discovers that directory. Run these mise tasks explicitly:

```bash
mise run skills-install
mise run skills-update
mise run skills-list
```

The general bootstrap leaves skills alone by default. To opt into installing
them as part of a full bootstrap, run:

```bash
DOTFILES_INSTALL_AI_SKILLS=1 mise run full-upgrade
```

## Local configuration and security

- Do not include secrets, private keys, or customer data in the repository.
- Local files ending in `.local`, `.env`, `.env.*`, key material, and the
  `config/.ssh/` directory are ignored by Git.
- Keep private Git identity in `~/.gitconfig.private`; the public
  configuration includes it only for repositories under `~/projects/`.
- The optional local zsh configuration is
  `~/.config/zsh/.zprofile.local`. Read the tracked `.example` file before
  creating your own.
- `scripts/open_apps.sh` reads one app name per line from the ignored
  `scripts/starting-apps.local`. Create that list separately on each machine.

See [SECURITY.md](SECURITY.md) for the policy and [AGENTS.md](AGENTS.md) for
the maintenance guide.

## Pre-commit checks

```bash
pre-commit install
make security
```

`make security` runs every hook against every file. The `shfmt` hook formats
shell files with writes, so review the diff afterwards.

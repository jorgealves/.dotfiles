# AGENTS.md

## Source of truth

Treat the code as authoritative. In particular:

- `bootstrap.sh` is the entry point and runs the `mise bootstrap` workflow.
- `config/mise/config.toml` defines packages, tools, dotfile mappings, and
  bootstrap preferences.
- `bootstrap.sh` installs mise directly through Homebrew when necessary; the
  current bootstrap flow does not invoke `Brewfile`.
- `Makefile` has only `run` and `security` targets; there is no `check`
  target.

Request confirmation before performing an action that changes the computer, the
repository, dependencies, or files outside this repository.

## Current structure

```text
.
├── bootstrap.sh             # Updates Homebrew and applies mise bootstrap
├── config/
│   ├── mise/config.toml     # Packages, runtimes, and dotfile mappings
│   ├── zsh/                 # ZDOTDIR, profile, and interactive shell
│   ├── nvim/                # LazyVim configuration
│   ├── opencode/            # OpenCode configuration
│   ├── git/ and .gitconfig  # Git exclusions and configuration
│   └── starship.toml        # Starship prompt
├── install/ai.sh            # Standalone script; bootstrap does not call it
└── lib/                     # Logging and small shell helpers
```

Do not use GNU Stow for this configuration: symlinks are declared in the mise
`[dotfiles]` section. The old install scripts for brew, shell, Git, dotfiles,
and Python do not exist.

## Installation and diagnostics

Homebrew is a prerequisite. The repository is currently configured to live in
`~/projects/.dotfiles`.

```bash
./bootstrap.sh
mise bootstrap status
mise bootstrap plan
```

`./bootstrap.sh` is mutating: it updates and upgrades Homebrew, may install
mise, and applies bootstrap with `--update`, `--force-dotfiles`, and
`--prompt-secrets`.

For hook checks:

```bash
make security
```

This command can change shell files through `shfmt -w`; do not treat it as a
read-only check.

## Changing tools or configuration

1. For Homebrew packages or casks, edit `[bootstrap.packages]`; for mise-managed
   runtimes, edit `[tools]` in `config/mise/config.toml`.
2. Place public configuration in `config/`, and add a `[dotfiles]` mapping
   when it should be linked into `$HOME`.
3. Keep secrets and machine-specific data out of versioned state.
4. Review `mise bootstrap plan` before applying bootstrap.

Supported local configuration is ignored by Git, including
`config/mise/config.local.toml` and `config/zsh/.zprofile.local`. The zsh
configuration looks for the latter at `~/.config/zsh/.zprofile.local`.

## Security

- Never add secrets, private keys, or customer information.
- `config/.ssh/`, `.gitconfig.private`, `.envrc.local`, `.env`, and local
  variants are ignored by Git.
- `~/.gitconfig.private` is included only for repositories under
  `~/projects/`.
- The SSH agent prefers the Bitwarden socket when it exists; otherwise, it uses
  `ssh-agent` and the keys defined in local zsh configuration.

Read [SECURITY.md](SECURITY.md) before changing exclusion or security rules.

## Included configuration

The current mappings cover mise, SSH, Git exclusions, `.gitconfig`, zsh,
VS Code, OpenCode, Starship, Neovim, and tmux. Active packages include
Git/GitHub CLI, Python, Node.js, Go, Rust, Docker Desktop, Kubernetes tools,
OpenCode, and Copilot CLI; the TOML remains the complete declaration.

Do not assume that commented tools, absent directories, or uncalled scripts are
part of a supported installation. In particular, there is no active
`agent_skills` system in the bootstrap flow.

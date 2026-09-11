# Security Policy

## Scope

This is a public repository of reusable dotfiles and setup scripts. Do not
store customer data, credentials, private keys, or internal identifiers here.

## Repository-enforced local files

The repository `.gitignore` excludes:

- local files matching `*.local` and `*.local.*`;
- `.env`, `.env.*`, and `.envrc.local`;
- common private-key and certificate extensions and names;
- `config/.ssh/`, private Git configuration, and client-specific Brewfiles.

These rules reduce the chance of committing local material; they do not replace
reviewing `git status` and staged changes before every commit.

## Local configuration

- Keep private Git identity in `~/.gitconfig.private`. The versioned Git
  configuration includes it only for repositories under `~/projects/`.
- Keep SSH keys outside this repository. The versioned zsh profile can load a
  local `~/.config/zsh/.zprofile.local` file that names keys to add to an SSH
  agent.
- When the Bitwarden SSH-agent socket exists, zsh uses it. Otherwise, it falls
  back to the system `ssh-agent`.

## Reporting

If you find a security issue, do not open a public issue with sensitive
details. Report it privately to the maintainer and include a clear description,
reproduction steps, potential impact, and, if available, a suggested mitigation.

## Privacy rules for public repositories

- Never include customer names in commits, branches, filenames, examples, or
  screenshots.
- Use anonymised placeholders such as `client-a`, `tenant-01`, and
  `example.com`.
- Keep customer-specific settings in local overrides outside version control.

## Incident response

1. Revoke or rotate exposed credentials immediately.
2. Remove the material from current files and Git history as appropriate.
3. Force-push cleaned history only when required and co-ordinated with affected
   collaborators.
4. Notify impacted stakeholders.
5. Add or adjust detection rules to prevent recurrence.

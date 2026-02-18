# Security Policy

## Scope
This repository is public and contains reusable dotfiles and setup scripts only.
Do not store customer data, credentials, private keys, or internal identifiers here.

## Reporting
If you find a security issue, do not open a public issue with sensitive details.
Report privately to the maintainer and include:
- A clear description of the issue
- Reproduction steps
- Potential impact
- Suggested mitigation (if available)

## Secret Handling Rules
- Use `.envrc.local` for machine-local secrets.
- Keep private Git identity in `~/.gitconfig.private` only.
- Never commit files matching:
  - `.env`, `.env.*`, `*.local`
  - `*.pem`, `*.key`, `*_rsa`, `id_rsa`, `id_ed25519`

## Privacy Rules for Public Repos
- Never include customer names in commits, branches, file names, examples, or screenshots.
- Use anonymized placeholders such as `client-a`, `tenant-01`, `example.com`.
- Avoid publishing internal hostnames, workspace names, account IDs, ticket IDs, or email addresses.
- Keep customer-specific settings in local overrides outside version control.

## Incident Response (If Something Leaks)
1. Revoke/rotate exposed credentials immediately.
2. Remove sensitive material from current files and Git history.
3. Force-push cleaned history when required.
4. Notify impacted stakeholders.
5. Add/adjust detection rules to prevent recurrence.

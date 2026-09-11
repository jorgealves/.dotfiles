# Neovim

This is the repository's personal LazyVim configuration, deployed by mise to
`~/.config/nvim` through the `[dotfiles]` mapping.

On first launch, `init.lua` bootstraps `lazy.nvim` from its stable branch and
then loads LazyVim plus the local plugin specifications in `lua/plugins/`.
The configuration currently selects the `catppuccin-mocha` colour scheme and
includes custom plugin settings, language extras, and a lockfile.

For upstream installation and LazyVim usage, see the
[LazyVim documentation](https://lazyvim.github.io/installation). Changes to
this directory should be made in the repository, not directly in
`~/.config/nvim`.

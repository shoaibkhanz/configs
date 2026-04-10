# configs

Personal configuration files for macOS development environment.

Paired with [macos-dev-bootstrap](https://github.com/shoaibkhanz/macos-dev-bootstrap) which automates installation and symlinking on a fresh machine.

## Structure

| Directory / File | What it configures |
|---|---|
| `dotfiles/` | `.zshrc`, `.tmux.conf`, `.gitconfig` |
| `nvim/` | Neovim (AstroNvim v5) with plugins |
| `aerospace/` | AeroSpace tiling window manager |
| `ghostty/` | Ghostty terminal emulator |
| `starship.toml` | Starship cross-shell prompt |
| `lazygit/` | LazyGit terminal UI for git |
| `marimo/` | Marimo notebook (toml, custom CSS, vimrc) |
| `sketchybar/` | macOS menu bar customisation |
| `vscode/` | VS Code settings and keybindings |
| `positron-ide/` | Positron (R/Python) IDE settings |
| `opencode/` | OpenCode AI assistant config |
| `zsh-aliases/` | Modular zsh alias files |
| `code_snippets/` | Reusable code examples |

## Theme

All tools share the **Yugen** colour scheme (from BetterVim):

- Background: `#000000`
- Foreground: `#D4D4D4`
- Accent: `#FFBE89` (peach)
- Green: `#7EAB8E`
- Border: `#2A2733`

## Secrets

API keys are **never** stored in this repo. Tools that need them (e.g. Marimo) read from environment variables set in `~/.secrets`, which is sourced by `.zshrc`.

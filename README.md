## Terminal setup on macOS

Ghostty, Starship, and eza share the terminal's ANSI color palette:

- Light mode: Ghostty's built-in `Monokai Pro Light Sun`.
- Dark mode: Ghostty's built-in `Catppuccin Mocha`.
- Starship uses terminal color names instead of fixed RGB colors.
- eza uses its default colors; `shell/alias.sh` provides `alias ls='eza'`.

### Install the tools and font

With Homebrew installed:

```shell
brew install --cask ghostty
brew install stow starship eza
```

Install the TX-02 font family separately on the new Mac to match this setup's
typeface, including its bold and italic faces. Font files are not stored here.
The configured theme names are included in Ghostty 1.4.0; use a current release.

### Link the terminal configuration

After cloning this repository, run from its root:

```shell
stow --target="$HOME" ghostty starship shell
```

This links `~/.config/ghostty`, `~/.config/starship.toml`, and `~/alias.sh`.
If Stow reports existing conflicting files, move or reconcile those files before
retrying; the command does not replace independent configuration files.

Add these lines to the new Mac's `~/.zshrc` if they are not already present:

```zsh
source "$HOME/alias.sh"
eval "$(starship init zsh)"
```

The `.zshrc` itself remains local and is not tracked by this repository.
Open a new Ghostty shell after setup. The palette follows macOS light/dark mode;
reload later Ghostty configuration changes with Command-Shift-Comma.

Install references: [Ghostty](https://ghostty.org/docs/install/binary),
[Starship](https://starship.rs/guide/),
[eza](https://github.com/eza-community/eza/blob/main/INSTALL.md).

## Git configuration

```shell
stow --target="$HOME" git
```

Neovim config is in nvim/.config/nvim directory


LSPs

```bash
    brew install lua-language-server
    rustup component add rust-analyzer


    # for telescope
    brew install ripgrep
    sudo apt-get install fd-find
```

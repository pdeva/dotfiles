# macOS setup

Install the desktop apps in `Brewfile` on a new MacBook with Homebrew.

## Install Homebrew

If Homebrew is already installed, skip this step. Otherwise, run the official installer in Terminal.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Follow the installer's **Next steps** to add Homebrew to your shell environment, then confirm it works.

```sh
brew --version
```

See the [Homebrew installation instructions](https://brew.sh/).

## Install apps

Open the Mac App Store and sign in with your Apple Account first. The Brewfile installs `mas`, the command-line tool used to install App Store apps. macOS may ask you to authenticate during installation. See the [mas documentation](https://github.com/mas-cli/mas#app-store-apple-account-requirements).

From the repository root, run the following command.

```sh
brew bundle install --file=macos-setup/Brewfile
```

You can also copy this folder to another Mac and run `brew bundle install` from inside it. Run the same command again after adding apps to the Brewfile.

## Included apps

- Google Chrome
- 1Password
- Sublime Text
- Sublime Merge
- Fork
- Task Manager TMOG
- Visual Studio Code
- ChatGPT desktop
- Claude desktop
- Ghostty
- Dropbox
- Devin Desktop
- Cursor
- Grok Bot desktop
- Hex (Anomaly)
- Loom (Atlassian)
- WhatsApp Messenger (Mac App Store)
- Amphetamine (Mac App Store)
- Magnet (Mac App Store)

The requested Claude Code desktop app is represented by the `claude` cask, which installs `Claude.app`. See the [Homebrew package details](https://formulae.brew.sh/cask/claude).

Open the apps after installation to complete sign-in, license activation, and any macOS permission prompts.

## Add an app

Find its package name with `brew search`, then add a `cask "package-name"` line to `Brewfile` and rerun the install command.

For Mac App Store apps, find the numeric ID with `mas search "app name"` or copy it from the app's App Store URL. Add an entry like the WhatsApp entry below, then rerun the same install command.

```ruby
mas "WhatsApp Messenger", id: 310633997
```

The ID above comes from the [WhatsApp App Store listing](https://apps.apple.com/us/app/whatsapp-messenger/id310633997). Purchase paid apps in the App Store before installing them through the Brewfile.

See the [Homebrew Bundle documentation](https://docs.brew.sh/Brew-Bundle-and-Brewfile).

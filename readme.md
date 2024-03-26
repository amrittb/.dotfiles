# Dotfiles

Configurations for:
- [Homebrew](https://brew.sh/)
- [Alacritty](https://alacritty.org/)
- [zsh](https://ohmyz.sh/)
- [tmux](https://github.com/tmux/tmux/wiki)
- [yabai](https://github.com/koekeishiya/yabai/wiki)
- [skhd](https://github.com/koekeishiya/skhd/wiki)
- [neovim](https://neovim.io/)


## Prerequisites
- Git should be installed.

Run the following to install XCode Developer tools in Macos.

```sh
git
```

## Setup

```sh
cd ~/

git clone https://github.com/amrittb/.dotfiles.git

cd ~/.dotfiles

./install.sh
```

## Post Setup

```sh
# Enable Accessibility settings
yabai --start-service
skhd --start-service

# Install neovim plugins
neovim

# Install tmux plugins
tmux

# Run install command <Leader> + I
```

## Recommended Settings
- Mac
  - Turn on hidding for dock
  - Change Appearance to Dark mode
  - Turn on "Reduce motion" in "Accessibility > Display" settings
  - Add 9 desktops & enable keyboard shortcut to allow switching to next desktop using `Control + <num>`
  - Disable command to switch input using `Control + Space`
  - Increase the "Key repeat rate" and decrease the "Delay until repeat"


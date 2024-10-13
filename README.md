### Required Tools

| Package   | config |
| -------   | ------ |
| arandr    | [/dotFiles/.config/i3/arandr/monitors.sh][PlAr]|
| i3-wm     | [/dotFiles/.config/i3/][Pli3] |
| feh       | [/dotFiles/.config/i3/wallpapers/.fehbg][PlFe]|
| picom     | [/dotFiles/.config/picom/picom.conf][PlPi]|
| kitty     | [/dotFiles/.config/kitty/kitty.conf][PlKi]|
| tmux      | [/dotFiles/.config/tmux/tmux.conf][PlTm]|
| nvim v0.10.1 | [/dotFiles/.config/nvim/][PlNv]|
| vim | [/dotFiles/.config/.vimrc][PlVi]|
| packer | [/dotFiles/.config/nvim/packerInstaller.sh][PlPa]|
| dunst | [/dotFiles/.config/dunst/dunstrc][PlDu]|
| tpm | Termux Package Manager |
| npm | JS Package Manager (needed to install some nvim plugins) |
| rofi | window switcher, run dialog |
| ranger | Terminal based Vim-like File Manager |
| evince | Pdf Reader |
| thunar | File Manager |
| playerctl | Keybindings for players |
| pactl | Keybindings for Fn Keys |


### Font
JetBrainsMono

```bash
mkdir -p ~/.local/share/fonts/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/NerdFontsSymbolsOnly.zip
unzip JetBrainsMono.zip -d ~/.local/share/fonts/
unzip -o NerdFontsSymbolsOnly.zip -d ~/.local/share/fonts/
fc-cache -fv
```
### Tmux Package Manager (tpm)
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

[Pli3]: <https://github.com/sumxtx/dotFiles/tree/main/.config/i3/>
[PlAr]: <https://github.com/sumxtx/dotFiles/tree/main/.config/i3/arandr/README.md>
[PlFe]: <https://github.com/sumxtx/dotFiles/tree/main/.config/i3/wallpapers/.fehbg>
[PlPi]: <https://github.com/sumxtx/dotFiles/tree/main/.config/picom/picom.conf>
[PlKi]: <https://github.com/sumxtx/dotFiles/tree/main/.config/kitty/kitty.conf>
[PlTm]: <https://github.com/sumxtx/dotFiles/tree/main/.config/tmux/tmux.conf>
[PlPa]: <https://github.com/sumxtx/dotFiles/tree/main/.config/nvim/packerInstaller.sh>
[PlDu]: <https://github.com/sumxtx/dotFiles/tree/main/.config/.vimrc>
[PlNv]: <https://github.com/sumxtx/dotFiles/tree/main/.config/nvim/README.md>
[PlVi]: <https://github.com/sumxtx/dotFiles/tree/main/.config/.vimrc>



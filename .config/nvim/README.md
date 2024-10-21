### Ubuntu / Debian
```bash
#Remove some posible older (v 0.9.5) not compatible with some plugins
sudo apt purge neovim && sudo apt autoremove
sudo apt-get install git ninja-build gettext cmake unzip curl build-essential
mkdir ~/Sources && cd ~/Sources
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
git checkout stable
sudo make install
```
### Arch Linux / Manjaro (Arch based OS's)
> It will probably be the latest and compatible version, direct from the repository
```bash
sudo pacman -Syyy neovim
```

<h3><a href="https://github.com/sumxtx/dotFiles/blob/main/.config/nvim/lua/v3n0m/remap.lua" target="_blank">Keyboard Combinations</a></h3>


|Insert Mode| |
| -----------: | :------------------------------------------------------------------------------- |
| <kbd> jj </kbd>  | Go Back to Normal mode |
| <kbd> j\\</kbd> | Line Jump| 
| <kbd> k\\</kbd> | Upper Line Jump| 
| <kbd> l\\</kbd> | Go right without need to be in normal mode| 
| <kbd> h\\</kbd> | Go left without need to be in normal mode| 
| <kbd> ""</kbd> | Open double quotes and put the cursor in between them| 
| <kbd> """</kbd> | Open triple quotes in two lines and put the cursor in between them|
| <kbd> ''</kbd> | Open single quotes and put the cursor in between them| 
| <kbd> ()</kbd> | Open parenthesis and put the cursor in between them| 
<kbd> Space + l </kbd>

|Normal Mode| |
| -----------: | :------------------------------------------------------------------------------- |
| <kbd> Space </kbd>  | Leader Key. Key used as an special key |
| <kbd> Space </kbd>

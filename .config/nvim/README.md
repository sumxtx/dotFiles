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

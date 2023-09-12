
#Check some directories
NVIMDIRECTORY=~/.config/nvim/
REPOSDIRECTORY=~/Templates/repos
STOW=/usr/local/stow

#Check some bins
isnvim=$(which nvim 1>/dev/null; echo $?;)
nvimversion=$(nvim --version | head -1 | sed -e 's|^[^0-9]*||' -e 's| .* ||')
whichstow=$(which stow 1>/dev/null; echo $?)


build_from_source(){
	if [ $whichstow -eq 1 ];
	then
		echo "Give stow a try!"
		exit 0;
	fi

	if [ ! -d "$REPOSDIRECTORY" ]; 
	then
		echo "$REPOSDIRECTORY does not  exist. Creating $REPOSDIRECTORY"
		mkdir $REPOSDIRECTORY
	fi

	cd $REPOSDIRECTORY  
	git clone https://github.com/neovim/neovim
	sudo apt-get install ninja-build gettext cmake unzip curl
	cd $REPOSDIRECTORY/neovim 
	make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$STOW/neovim"
	sudo make install
}

get_configs(){
	if [ $isnvim -eq 0 ];
	then
		echo "All good i guess"
		#get .configs
		git clone https://github.com/sumxtx/dotFiles $REPOSDIRECTORY/dotFiles
	fi

	if [ ! -d "$NVIMDIRECTORY" ];
	then
		echo "$NVIMDIRECTORY does not  exist. Creating $NVIMDIRECTORY"
		cp -R $REPOSDIRECTORY/dotFiles/.config/nvim/ $NVIMDIRECTORY/
		sh $NVIMDIRECTORY/packerInstaller.sh
		sudo apt install npm
    nvim -c 'PackerUpdate'
    #nvim :PackerSync and : PackerUpdate

	else
		echo "Directories exists. You may want to Move  it first"
	fi
	
}

if [ $isnvim -eq 1 ];
then
	echo "Nvim not found in path. Suppose not installed."
	build_from_source
else
	echo "Nvim version is: $nvimversion, Ensure it's compatible.\n Or Everything will go BRRR!!!!\n\
		As i can't handle it."
	get_configs
fi






#!/bin/bash
############################
# .make.sh
# This script will install all dependencies, 
# move the existing configuration files into a /old_comprc directory, 
# and symlink the configuration files into the home directory.
############################

########## Variables

dir=~/comprc                                # dotfiles directory
olddir=~/comprc_old                         # old dotfiles backup directory
files="zshrc vimrc vim tmux.conf alacritty.yml"    # list of files/folders to symlink in homedir

##########
echo "Installing Xcode Developer Tools"
xcode-select --install

echo "Install brew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing OS Dependencies"
brew bundle

# oh my zsh
echo "Installing Oh My Zsh"
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Change permissions on zsh files
sudo chown -R $(whoami):staff ~/.oh-my-zsh ~/.zsh*

# oh my zsh plugins
## syntax highlighting
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

mkdir -p ~/dev
# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "Finished creating $olddir for backup of any existing dotfiles in ~"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "Finished changing to the $dir directory"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
  mv ~/.$file $olddir
  echo "Creating symlink to $file in home directory."
  ln -s $dir/.$file ~/.$file
done
echo "Finished moving any existing dotfiles from ~ to $olddir"

# Install Plug for managing Vim plugins
echo "Installing Plug"
sudo curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Finished installing Plug"

# Change permissions on autload file
echo "Changing vim autoload permissions"
sudo chmod -R 755 ~/.vim/autoload
echo "Finished changing vim autoload permissions"

# Install the rest of the plugins
echo "Installing All Vim Plugins"
sudo vim +PlugInstall +qall
echo "Finished Installing All Vim Plugins"

 #Change permissions on autload file...already do this up above
#sudo chmod -R 755 ~/.vim/autoload

# Make fzf history public
echo "Changing fzf history permissions"
sudo chmod -R 755 ~/.local/share/fzf-history
echo "Finished changing fzf history permissions"

# switch to zsh shell
echo "Making zsh default shell"
sudo chsh -s /bin/zsh
echo "Finished making zsh default shell"

# Source bashrc in bash profile
#sudo echo "source ~/.bashrc" >> ~/.bash_profile

# Source zshrc in zprofile
#sudo echo "source ~/.zshrc" >> ~/.zprofile

# Clear the screen
clear

tmux

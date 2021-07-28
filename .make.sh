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
#xcode-select --install

echo "Install brew"
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing OS Dependencies"
#brew bundle

# oh my zsh
echo "Installing Oh My Zsh"
rm -rf ~/.oh-my-zsh
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Change permissions on zsh files
#sudo chown -R $(whoami):staff ~/.oh-my-zsh ~/.zsh*

# oh my zsh plugins
## syntax highlighting
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Creating dev folder ~"
mkdir -p ~/dev
# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "Finished creating $olddir for backup of any existing dotfiles in ~"


# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
echo "Moving any existing dotfiles from ~ to $olddir"
cd $dir
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

# Make fzf history public
echo "Changing fzf history permissions"
sudo chmod -R 755 ~/.local/share/fzf-history
echo "Finished changing fzf history permissions"

# switch to zsh shell
echo "Making zsh default shell"
sudo chsh -s /bin/zsh
echo "Finished making zsh default shell"

rm -rf ~/.zshrc.pre*

clear

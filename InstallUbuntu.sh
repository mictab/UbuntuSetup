# Install script for Ubuntu, inspired by @oalsing but for my own needs.
# Michel Tabari 2015
# !/bin/sh

echo "Welcome to the install script! This script will install some basic stuff for you! Press any key to continue, otherwise close the terminal"
read ANSWER

echo "Now adding sources...."
# Adding custom sources
sudo sh -c "echo '### PPA ###' >> /etc/apt/sources.list"


# Let's get some repositories!

# --------- Skype --------- #
# Enable multiarch
sudo dpkg --add-architecture i386

# Partner repository
sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"

# -------- END ------------ #


# --------- Spotify -------- #
# Add repository
sudo add-apt-repository "deb http://repository.spotify.com stable non-free"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59

# --------- END ------------ #


# ---------- Dropbox -------- #
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
sudo add-apt-repository "deb http://linux.dropbox.com/ubuntu $(lsb_release -sc) main"

# ---------- END ------------- #

echo "Now we've added the prerequisites for Skype, Spotify and Dropbox for you!"

echo "Updating your packages..."
# Let's update and upgrade
sudo apt-get update
sudo apt-get upgrade

echo "Done"

echo "Now we will proceed to install a bunch of stuff for you. Please enter any key to continue, otherwise close the terminal"
read ANSWER

# Change directory to root
cd ~

echo "Installing....."
sudo apt-get install spotify-client texlive vim vim-gnome vlc dropbox filezilla gcc gdb gdm flashplugin-installer idle-python3.3 git golang xclip putty mpg321 skype gprolog ghc unrar wine htop vim awesome awesome-extra arandr

echo "Done"

# ------- Install zsh and Oh-my-zsh ------- #
echo "Would you like to install zsh and Oh-my-zsh? (y/n)"
read ANSWER
if [ "$ANSWER" == 'y' ] || [ "$ANSWER" == 'Y']; then
  sudo apt-get install zsh
  sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
  chsh -s /bin/zsh
fi

echo "We're done. Would you like to restart your computer? (y/n)"
if [ "$ANSWER" == 'y' ] || [ "$ANSWER" == 'Y']; then
  sudo reboot
fi

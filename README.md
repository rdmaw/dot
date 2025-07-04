<h1 align="center">My config</h1>
<h3 align="center">A step by step guide for when I change my workspace.</h3>
<h4 align="center">This guide is intended for my personal use, but you can fork it to create something similar for yourself.
<br />
Made with WSL and macOS in mind.</h4>

---

- [1 - Bash, Terminal and WSL](#step-1)
- [2 - Package Manager, Git and SSH](#step-2)
- [3 - ZSH, Node and scripts](#step-3)
  - [ZSH](#set-up-and-configure-zsh)
  - [Zinit](#set-up-zinit)
  - [krabby](#installing-krabby)
  - [Node](#node-and-node-version-manager)
  - [Oh My Posh](#installing-oh-my-posh-with-a-custom-theme)
  - [eza, tokei, fzf, fastfetch, zoxide and tree](#installing-eza-tokei-fzf-fastfetch-or-neofetch-d-zoxide-and-tree)
  - [zshrc](#finishing-off-the-zsh-section)
- [4 - Neovim](#step-4)
  - [Required packages](#setting-up-neovim)
  - [Neovim](#installing-neovim)
- [5 - Tmux](#step-5)
- [6 - Extras](#step-6)

## Step 1

### BASH, WSL and terminal environment

Start by installing WSL from the [store](https://aka.ms/wslstorepage), then restart your computer and download your distro of choice:

Arch:
```bat
wsl --install archlinux
wsl.exe -d archlinux
```

Ubuntu:
```bat
wsl --install Ubuntu
wsl.exe -d Ubuntu
```

Arch: Refresh packages:
```bash
pacman -Syu
```

Arch: Set up root password, then a user with a password (remember to give user root/sudo access):
```bash
passwd
```
```bash
useradd -m -G wheel <user>
passwd <user>
```

Arch: Set up sudo access:
```bash
pacman -S sudo vim
EDITOR=vim visudo # Uncomment the line "#%wheel ALL=(ALL) ALL" to give sudo privileges to all users in wheel group
```

Arch: Add this to your wsl.conf inside /etc/ in arch, then shutdownn:
```bash
[user]
default=<user>
```
```bat
wsl --shutdown archlinux
```


Download and paste the .wezterm.lua file in your users folder in windows if using wezterm (optional).
Install the official WSL extension for VSCode and open any folder to test:
```bash
code .
```

## Step 2

### Package Managers and Git version control

Arch: Configure locale:
```bash
sudo pacman -S glibc
sudo vim /etc/locale.gen
```

Arch: Uncomment the following (pick your own preferred language and region):
```bash
en_US.UTF-8 UTF-8
nb_NO.UTF-8 UTF-8 # Pick your own language
```

Arch: Save the file and generate locale:
```bash
:wq
sudo locale-gen
```

Arch: Install git:
```bash
sudo pacman -S git
```

Ubuntu: Install homebrew and follow the instructions:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Remove aggregate formulae and cask analytics by adding the following line to your .bashrc:
```bash
export HOMEBREW_NO_ANALYTICS=1
```

Add homebrew to your Path, replacing user with your UNIX username:
```bash
echo >> /home/user/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/user/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

Install homebrew's dependencies using apt-get:
```bash
sudo apt update
sudo apt-get install build-essential
```

Also install GCC as recommended by homebrew:
```bash
brew update
brew install gcc
```

Install git using homebrew:
```bash
brew update
brew install git
```

Configure globals (optional):
```bash
git config --global user.name "<user>"
git config --global user.email "12345678+<user>@users.noreply.github.com"
git config --global init.defaultBranch main
git config --global core.autocrlf input
```

Set up ssh connection (optional):
```bash
sudo pacman -S openssh
ssh-keygen -t ed25519 -C "12345678+<user>@users.noreply.github.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
```

Highlight and copy the cat output (skip, if not following above):
1. Log in to [github.com](https://github.com/)
2. Go to Settings -> SSH and GPG keys under the 'Access' section
3. Create New SSH key and add a custom title (e.g. your terminal name)
4. Paste the copied output into the 'Key' field
5. Add SSH key

Test the SSH connection, and answer yes to connect (skip, if not following above):
```bash
ssh -T git@github.com # if successful, should print 'Hi <user>! You've successfully authenticated, but GitHub does not provide shell access.'
```

Automating the SSH key on startup with an agent will be done at the end of Step 3.

Create .bashrc and .vimrc files if they don't exist and update them with the repo versions.

## Step 3

### Set up and configure ZSH

Install ZSH using apt:
```bash
sudo apt update
sudo apt install zsh -y
zsh --version # should print 'zsh 5.9'
```

If you're on macOS, install using homebrew (included since Catalina):
```bash
brew update
brew install zsh
zsh --version # should print '5.9'
```

Create an empty .zshrc file inside your home directory:
```bash
touch ~/.zshrc
```

Set ZSH to be the default shell and reload your terminal:
```bash
chsh -s $(which zsh)
```

### Set up Zinit

Install zinit using curl:

```bash
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
```

Reload your terminal and compile zinit:
```bash
zinit self-update
```

Reload again and check if zinit is installed by running:
```bash
zinit zstatus
```

### Installing krabby

Check if python3 is installed (might not be required, but important anyway):
```bash
python3 --version # should print 'Python 3.12.3'
which python3
```

Arch:
```bash
sudo pacman -S python python-pip
```

Set up if not installed:
```bash
sudo apt update
sudo apt install python3 -y
```

Install pip (optional):
```bash
sudo apt install python3-pip -y
pip3 --version # should print 'pip 24.0'
```

Install python3-venv (optional, but required later for some formatters):
```bash
sudo apt update
sudo apt install -y python3-venv
```

If you're on macOS, install using homebrew (might be preinstalled):
```bash
brew update
brew install python
python3 --version
pip3 --version
```

Lastly, install krabby using homebrew:
```bash
brew update
brew tap yannjor/krabby
brew install krabby
```

If the install requires cargo, install cargo/rust:
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update
cargo --version # should print '1.83.0'
```

If on arch, install using yay:
```bash
sudo pacman -S --needed base-devel
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

If installed successfully, remove the git folder and install krabby:
```bash
rm -rf ~/yay
yay -S krabby-bin
```

You can test to see if it works by printing any pokemon you like:
```bash
krabby random --no-title --padding-left 2
krabby name flareon --no-title --padding-left 2
```

### Node and node version manager

Install node version manager using curl and source your '.zshrc' file:
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
source ~/.zshrc
```

Then install node using the version manager:
```bash
nvm install 23
node -v # should print 'v23.4.0'
npm -v # should print '10.9.2'
```

Arch: For arch simply do:
```bash
sudo pacman -S nodejs npm
```

### Installing Oh My Posh with a custom theme

Firstly, install unzip (required):
```bash
sudo apt update
sudo apt install unzip
```

Arch:
```bash
sudo pacman -S unzip
```

Secondly, install Oh My Posh to your system using curl:
```bash
curl -s https://ohmyposh.dev/install.sh | bash -s
```

If you're on macOS, install using homebrew:
```bash
brew update
brew install jandedobbeleer/oh-my-posh/oh-my-posh
```

Also add the following line to avoid loading Oh My Posh in the default macOS terminal, which is unsupported:
```bash
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh)"
fi
```

After installing on any of the systems, add the installation directory to your Path in your '.zshrc' file:
```bash
export PATH=$HOME/bin:$HOME/.local/bin:$PATH
```

Create a config file for your custom prompt and paste the contents from redmaw.json into this file:
```bash
mkdir -p ~/.config/ohmyposh && cd ~/.config/ohmyposh
oh-my-posh config export --format json --output ~/.config/ohmyposh/redmaw.json
cd ohmyposh && vi redmaw.json
```

Configure Oh My Posh to use your custom json file by adding the following line to your ',zshrc' file, and then sourcing it:
```bash
eval "$(oh-my-posh init zsh --config '~/.config/ohmyposh/redmaw.json')"
source ~/.zshrc
```

Your prompt should have changed to the default prompt theme. To update it match the contents of redmaw.json to the same file included in this repository.

### Installing eza, tokei, fzf, fastfetch (or neofetch :D), zoxide and tree

Check if you have any of them installed first to avoid duplicates using which:
```bash
for cmd in eza tokei fzf fastfetch zoxide tree; do which $cmd; done
```

Install using homebrew:
```bash
brew update
brew install eza tokei fzf fastfetch zoxide tree
```

Arch:
```bash
sudo pacman -S eza tokei fzf fastfetch zoxide tree
```

Check if the packages are up to date:
```bash
eza --version # should print 'v0.20.12'
tokei --version # should print '12.1.2'
fzf --version # should print '0.57.0'
fastfetch --version # should print '2.31.0'
zoxide --version # should print '0.9.6'
```

### Finishing off the ZSH section

If you're on linux or WSL, add the following line under "# PATH" in your '.zshrc' file:
```bash
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

If you're on macOS, add this line instead:
```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

Open your .zshrc file and match the contents to the repository file:
```bash
vim ~/.zshrc
```

## Step 4

### Setting up neovim

Ubuntu:
Start off by installing some commonly used packages:

```bash
sudo apt update
sudo apt install ninja-build gettext cmake curl
```

Secondly, install fd-find and ripgrep, as they're both needed for telescope:

```bash
brew update
brew install fd ripgrep
```

If you're on macOS, install them using homebrew:

```bash
brew update
brew install curl cmake make unzip ninja gettext fd ripgrep
```

If you didn't do it earlier, install python3-venv, which is required for Mason to install python related formatters:

```bash
sudo apt update
sudo apt install -y python3-venv
```

For macOS, venv should already be available:

```bash
python3 -m venv --help
```

If not, install it by using homebrew:

```bash
brew update
brew install python
```

### Lazygit

Install lazygit using homebrew:

```bash
brew update
brew install lazygit
lazygit --version # should print 'version=0.44.1'
```

### Installing neovim

Install neovim using homebrew:

```bash
brew update
brew install neovim
nvim -v # should print 'NVIM v0.10.2'
```

Arch:
```bash
sudo pacman -S neovim lazygit fd ripgrep unzip wget python python-pip
```

Initialize your nvim folder by adding your neovim config:

```bash
cd ~/.config
git clone git@github.com:username/nvim.git
```

Open neovim and run checkhealth to see if everything works and you aren't missing any required packages:

```vim
:checkhealth
```

Don't forget to check that all of your options and keybindings work as expected!

## Step 5

### Setting up tmux multiplexer

Tmux could be preinstalled so check if you have it first, before installing with homebrew:

```bash
tmux -V # should print 'tmux 3.5a'
brew update
brew install tmux
```

Install tpm and create the tmux configuration file:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
touch ~/.tmux.conf
```

Pull or copy the '.tmux.conf' file from this repository into your tmux file.

## Step 6

### Unimatrix

Install using curl:

```bash
sudo curl -L https://raw.githubusercontent.com/will8211/unimatrix/master/unimatrix.py -o /usr/local/bin/unimatrix
sudo chmod a+rx /usr/local/bin/unimatrix
```

### LightningCSS and Terser

Install globally `-g` or locally `--save-dev`
```bash
npm install -g lightningcss-cli terser
```

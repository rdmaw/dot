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
  - [pokemon-colorscripts](#installing-pokemon-colorscripts)
  - [Node](#node-and-node-version-manager)
  - [Oh My Posh](#installing-oh-my-posh-with-a-custom-theme)
  - [eza, tokei, fzf, fastfetch, zoxide and tree](#installing-eza-tokei-fzf-fastfetch-zoxide-and-tree)
  - [zshrc](#finishing-off-the-zsh-section)
- [4 - Neovim](#step-4)
  - [Required packages](#setting-up-neovim)
  - [Neovim](#installing-neovim)
- [5 - Tmux](#step-5)

## Step 1

### BASH, WSL and terminal environment

Start by installing WSL using cmd or powershell:

```bat
wsl --install -d Ubuntu
```

Restart your terminal or pc, and set up your user.

Pull or copy the .bashrc and .vimrc file contents from this repository to update your own.

Additionally, pull or copy the contents from .wezterm.lua if using wezterm (optional):

```bash
cd && touch .wezterm.lua
vi .wezterm.lua
```

Set up Remote - WSL (only needed for WSL environments, and if using VSCode):

```bash
code .
```

## Step 2

### Package Managers and Git version control

Install homebrew and follow the instructions:

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
git -v # should print 'git version 2.47.1'
```

Configure globals (optional):

```bash
git config --global user.name "username"
git config --global user.email "12345678+username@users.noreply.github.com"
git config --global init.defaultBranch main
git config --global core.autocrlf input
```

Set up ssh connection (optional):

```bash
ssh-keygen -t ed25519 -C "12345678+username@users.noreply.github.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
```

Highlight and copy the output (skip, if not following above):

1. Log in to [github.com](https://github.com/)
2. Go to Settings -> SSH and GPG keys under the 'Access' section
3. Create New SSH key and add a custom title (e.g. your terminal name)
4. Paste the copied output into the 'Key' field
5. Add SSH key

Test the SSH connection, and answer yes to connect (skip, if not following above):

```bash
ssh -T git@github.com # if successful, should print 'Hi username! You've successfully authenticated, but GitHub does not provide shell access.'
```

Automating the SSH key on startup with an agent will be done at the end of Step 3.

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

```zsh
touch ~/.zshrc
```

Set ZSH to be the default shell and reload your terminal:

```bash
chsh -s $(which zsh)
```

### Set up Zinit

Install zinit using curl:

```zsh
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
```

Reload your terminal and compile zinit:

```zsh
zinit self-update
```

Reload again and check if zinit is installed by running:

```zsh
zinit zstatus
```

### Installing pokemon-colorscripts

Check if python3 is installed (required):

```zsh
python3 --version # should print 'Python 3.12.3'
which python3
```

Set up if not installed:

```zsh
sudo apt update
sudo apt install python3 -y
```

Install pip (optional):

```zsh
sudo apt install python3-pip -y
pip3 --version # should print 'pip 24.0'
```

Install python3-venv (optional, but required later for some formatters):

```zsh
sudo apt update
sudo apt install -y python3-venv
```

If you're on macOS, install using homebrew (might be preinstalled):

```zsh
brew update
brew install python
python3 --version
pip3 --version
```

Lastly, install pokemon-colorscrips:

```zsh
git clone https://gitlab.com/phoneybadger/pokemon-colorscripts.git
cd pokemon-colorscripts
sudo ./install.sh
```

You can test to see if it works by printing any pokemon you like:

```zsh
pokemon-colorscripts -n flareon --no-title
```

### Node and node version manager

Install node version manager using curl and source your '.zshrc' file:

```zsh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
source ~/.zshrc
```

Then install node using the version manager:

```zsh
nvm install 23
node -v # should print `v23.4.0`
npm -v # should print `10.9.2`
```

### Installing Oh My Posh with a custom theme

Firstly, install unzip (required):

```zsh
sudo apt update
sudo apt install unzip
```

Secondly, install Oh My Posh to your system using curl:

```zsh
curl -s https://ohmyposh.dev/install.sh | bash -s
```

If you're on macOS, install using homebrew:

```zsh
brew update
brew install jandedobbeleer/oh-my-posh/oh-my-posh
```

Also add the following line to avoid loading Oh My Posh in the default macOS terminal, which is unsupported:

```zsh
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh)"
fi
```

After installing on any of the systems, add the installation directory to your Path in your '.zshrc' file:

```zsh
export PATH=$HOME/bin:$HOME/.local/bin:$PATH
```

Create a config file for your custom prompt and paste the contents from redmaw.json into this file:

```zsh
mkdir -p ~/.config/ohmyposh && cd ~/.config/ohmyposh
oh-my-posh config export --format json --output ~/.config/ohmyposh/redmaw.json
cd ohmyposh && vi redmaw.json
```

Configure Oh My Posh to use your custom json file by adding the following line to your ',zshrc' file, and then sourcing it:

```zsh
eval "$(oh-my-posh init zsh --config '~/.config/ohmyposh/redmaw.json')"
source ~/.zshrc
```

Your prompt should have changed to the default prompt theme. To update it match the contents of redmaw.json to the same file included in this repository.

### Installing eza, tokei, fzf, fastfetch, zoxide and tree

Check if you have any of them installed first to avoid duplicates using which:

```zsh
for cmd in eza tokei fzf fastfetch zoxide tree; do which $cmd; done
```

Install using homebrew:

```zsh
brew update
brew install eza tokei fzf fastfetch zoxide tree
```

Check if the packages are up to date:

```zsh
eza --version # should print 'v0.20.12'
tokei --version # should print '12.1.2'
fzf --version # should print '0.57.0'
fastfetch --version # should print '2.31.0'
zoxide --version # should print '0.9.6'
```

### Finishing off the ZSH section

If you're on linux or WSL, add the following line under "# PATH" in your '.zshrc' file:

```zsh
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

If you're on macOS, add this line instead:

```zsh
eval "$(/opt/homebrew/bin/brew shellenv)"
```

Open your .zshrc file and match the contents to the repository file:

```zsh
vi ~/.zshrc
```

## Step 4

### Setting up neovim

Start off by installing some commonly used packages:

```zsh
sudo apt update
sudo apt install ninja-build gettext cmake curl
```

Secondly, install fd-find and ripgrep, as they're both needed for telescope:

```zsh
brew update
brew install fd ripgrep
```

If you're on macOS, install them using homebrew:

```zsh
brew update
brew install curl cmake make unzip ninja gettext fd ripgrep
```

If you didn't do it earlier, install python3-venv, which is required for Mason to install python related formatters:

```zsh
sudo apt update
sudo apt install -y python3-venv
```

For macOS, venv should already be available:

```zsh
python3 -m venv --help
```

If not, install it by using homebrew:

```zsh
brew update
brew install python
```

### Lazygit

Install lazygit using homebrew:

```zsh
brew update
brew install lazygit
lazygit --version # should print 'version=0.44.1'
```

### Installing neovim

Install neovim using homebrew:

```zsh
brew update
brew install neovim
nvim -v # should print 'NVIM v0.10.2'
```

Initialize your nvim folder by adding your neovim config:

```zsh
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

```zsh
tmux -V # should print 'tmux 3.5a'
brew update
brew install tmux
```

Install tpm and create the tmux configuration file:

```zsh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
touch ~/.tmux.conf
```

Add the colorscheme from this repository to tmux:

```zsh
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.2 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
```

Pull or copy the '.tmux.conf' file from this repository into your tmux file.

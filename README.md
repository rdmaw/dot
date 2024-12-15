<h1 align="center">My config</h1>
<h3 align="center">A step by step setup for when I change my workspace.</h3>
<h4 align="center">This guide is intended for my personal use, but you can fork it to create something similar for yourself.
<br />
Made with WSL and macOS in mind.</h4>

## Step 1

### BASH, WSL and terminal environment

Start by installing WSL using cmd or powershell:

```bat
wsl --install -d Ubuntu
```

Restart your terminal or pc, and set up your user.

Pull or copy the .bashrc file contents from this repository to update your own.

Additionally, pull or copy the contents from .wezterm.lua if using wezterm (optional):

```shell
cd ~ && touch .wezterm.lua
vi .wezterm.lua
```

Set up Remote - WSL and follow the instructions to install (only needed for WSL environments, and if using VSCode):

```shell
code .
```

## Step 2

### Package Managers and Git version control

Install homebrew and follow the instructions:

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install git using homebrew:

```shell
brew update
brew install git
git -version # should print '2.47.1'
```

Configure globals (optional):

```shell
git config --global user.name "username"
git config --global user.email "12345678+username@users.noreply.github.com"
git config --global init.defaultBranch main
git config --global core.autocrlf input
```

Set up ssh connection (optional):

```shell
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

```shell
ssh -T git@github.com # if successful, should print 'Hi username! You've successfully authenticated, but GitHub does not provide shell access.'
```

Automating the SSH key on startup with an agent will be done at the end of Step 3.

## Step 3

### Set up and configure ZSH

Install ZSH using apt:

```shell
sudo apt update
sudo apt install zsh -y
zsh --version # should print '5.9'
```

If you're on macOS, install using homebrew (included since Catalina):

```shell
brew update
brew install zsh
zsh --version # should print '5.9'
```

Set ZSH as the default shell:

```shell
chsh -s $(which zsh)
```

Create empty .zshrc file inside the home directory:

```shell
touch ~/.zshrc
```

### Set up Zinit

Install zinit using curl:

```shell
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
```

Reload your terminal and compile zinit:

```shell
zinit self-update
```

Reload again and check if zinit is installed by running:

```shell
zinit zstatus
```

### Installing pokemon-colorscripts

Check if python3 is installed (required):

```shell
python3 --version
which python3
```

Set up if not installed:

```shell
sudo apt update
sudo apt install python3 -y
```

Install pip (optional):

```shell
sudo apt install python3-pip -y
pip3 --version
```

Install python3-venv (optional, but required later for some formatters):

```shell
sudo apt update
sudo apt install -y python3-venv
```

If you're on macOS, install using homebrew (might be preinstalled):

```shell
brew update
brew install python
python3 --version
pip3 --version
```

Lastly, install pokemon-colorscrips:

```shell
git clone https://gitlab.com/phoneybadger/pokemon-colorscripts.git
cd pokemon-colorscripts
sudo ./install.sh
```

### Node and node version manager

Install node version manager using curl:

```shell
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
```

Then install node using the version manager:

```shell
nvm install 23
node -v # should print `v23.4.0`
npm -v # should print `10.9.2`
```

Open and check your '.bashrc' or '.zshrc' file, to see if the paths from nvm were created. If not add them manually under '# PATH' in your '.zshrc' file:

```shell
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

### Installing Oh My Posh with a custom theme

Install Oh My Posh using curl:

```shell
curl -s https://ohmyposh.dev/install.sh | bash -s
```

If you're on macOS, install using homebrew:

```shell
brew update
brew install jandedobbeleer/oh-my-posh/oh-my-posh
```

Also add the following line to avoid loading Oh My Posh in the default macOS terminal, which is unsupported:

```shell
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh)"
fi
```

Create a config file for your custom prompt and paste the contents from redmaw.json into this file:

```shell
mkdir -p ~/.config/ohmyposh && cd ~/.config/ohmyposh
oh-my-posh config export --format json --output ~/.config/ohmyposh/redmaw.json
vi redmaw.json
```

### Installing eza, tokei, fzf, fastfetch and zoxide

Check if you have any of them installed first to avoid duplicates using which:

```shell
for cmd in eza tokei fzf fastfetch zoxide; do which $cmd; done
```

Install using homebrew:

```shell
brew update
brew install eza tokei fzf fastfetch zoxide
```

Check if the packages are up to date:

```shell
eza --version # should print '0.20.12'
tokei --version # should print '12.1.2'
fzf --version # should print '0.56.3'
fastfetch --version # should print '2.31.0'
zoxide --version # should print '0.9.6'
```

### Finishing off the ZSH section

Open your .zshrc file and match the contents to the repository file:

```shell
vi ~/.zshrc
```

If you're on linux or WSL, add the following line under "# PATH":

```shell
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

If you're on macOS, add this line instead:

```shell
eval "$(/opt/homebrew/bin/brew shellenv)"
```

If you didn't already, configure Oh My Posh to use your custom json file:

```shell
eval "$(oh-my-posh init zsh --config '~/.config/ohmyposh/redmaw.json')"
```

## Step 4

### Setting up neovim

Start off by installing some commonly used packages:

```shell
sudo apt update
sudo apt install ninja-build gettext cmake unzip curl build-essential
```

Secondly, install fd-find and ripgrep, as they're both needed for telescope:

```shell
brew update
brew install fd ripgrep
```

If you're on macOS, install them using homebrew:

```shell
brew update
brew install curl cmake make unzip ninja gettext fd ripgrep
```

If you didn't do it earlier, install python3-venv, which is required for Mason to install python related formatters:

```shell
sudo apt update
sudo apt install -y python3-venv
```

For macOS, venv should already be available:

```shell
python3 -m venv --help
```

If not, install it by using homebrew:

```shell
brew update
brew install python
```

### Installing neovim

Install neovim using homebrew:

```shell
brew update
brew install neovim
nvim -v # should print '0.10.2'
```

Initialize your nvim folder by adding your neovim config:

```shell
cd ~/.config
git clone git@github.com:username/nvim.git
```

Run checkhealth for your plugin manager and then repeat the process with all of your plugins individually to check if everything works and you aren't missing any required packages (e.g. unzip, ripgrep, python3-venv, etc):

```vim
cd ~/.config/nvim && nvim
:checkhealth lazy
:checkhealth telescope
:checkhealth otherpluginname
```

Don't forget to check that all of your options and keybindings work as expected!

## Step 5

### Lazygit

Install lazygit using homebrew:

```shell
brew update
brew install lazygit
lazygit --version # should print '0.44.1'
```

## Step 6

### Setting up tmux multiplexer

Install tmux using homebrew:

```shell
brew update
brew install tmux
tmux --version # should print '3.5a'
```

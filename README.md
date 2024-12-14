<h1 align="center">Dotfiles</h1>
<h2 align="center">My entire config and a step by step setup for when I change my workspace or reinstall. Made with WSL and macOS in mind.</h2>

### Step 1
#### Configure BASH and terminal environment

Pull or copy the .bashrc file contents from this repository to your own.

Pull or copy contents from .wezterm.lua if using wezterm (optional)
```
cd ~ && touch .wezterm.lua
vim .wezterm.lua
```

### Step 2
#### Install Package Managers and Git version control

Install homebrew and follow the instructions:
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install latest git upstream
```
add-apt-repository ppa:git-core/ppa
apt update; apt install git
git -version # should print '2.47.1'
```

If you're on macOS, install using homebrew:
```
brew install git
git -version # should print '2.47.1'
```

Configure git globals (optional):
```
git config --global user.name "username"
git config --global user.email "12345678+username@users.noreply.github.com"
git config --global init.defaultBranch main
git config --global core.autocrlf input
```

Setup github ssh connection (optional):
```
ssh-keygen -t ed25519 -C "12345678+username@users.noreply.github.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
```

Highlight and copy the entire cat output (skip, if not following above):
1. Log in to [github.com](https://github.com/)
2. Go to Settings -> SSH and GPG keys under 'Access'
3. Create New SSH key and add a custom title (ex: your terminal name)
4. Paste the copied output into the 'Key' field
5. Add SSH key

Test the SSH connection, and answer yes to connect (skip, if not following above):
```
ssh -T git@github.com # if successful, should print 'Hi username! You've successfully authenticated, but GitHub does not provide shell access.'
```

Automating the SSH key on startup with an agent will be done the end of Step 3.

### Step 3
#### Setup and configure ZSH

Install ZSH:
```
sudo apt update
sudo apt install zsh -y
zsh --version # should print '5.9'
```

If you're on macOS, install using homebrew (included since Catalina):
```
brew install zsh
zsh --version # should print '5.9'
```

Set ZSH as the default shell:
```
chsh -s $(which zsh)
```

Create empty .zshrc file inside the home directory:
```
touch ~/.zshrc
```

#### Install zinit:
```
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
```

Reload your terminal and compile zinit:
 ```
zinit self-update
```

Reload again and check if it is installed by running:
```
zinit zstatus
``` 

#### Install pokemon-colorscripts

Check if python3 is installed (required):
```
python3 --version
which python3
```

Setup if not installed:
```
sudo apt update
sudo apt install python3 -y
```

Install pip (optional):
```
sudo apt install python3-pip -y
pip3 --version
```

If you're on macOS, install using homebrew (might be preinstalled):
```
brew install python
python3 --version
pip3 --version
```

Install pokemon-colorscrips:
```
git clone https://gitlab.com/phoneybadger/pokemon-colorscripts.git
cd pokemon-colorscripts
sudo ./install.sh
```

#### Install LTS node and node version manager:
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
nvm install 23
node -v # should print `v23.4.0`
npm -v # should print `10.9.2`
```

Check .bashrc or .zshrc if node paths were created.
<br />
If not add them manually:
```
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

#### Install Oh My Posh and create custom prompt

Install Oh My Posh:
```
curl -s https://ohmyposh.dev/install.sh | bash -s
```

If you're on macOS, install using homebrew:
```
brew install jandedobbeleer/oh-my-posh/oh-my-posh
```

Also add the following line to be avoid loading Oh My Posh in the default terminal on macOS (unsupported):
```
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh)"
fi
```

Create a config file for your custom prompt and paste the contents from redmaw.json into this file:
```
mkdir ~/.config/ohmyposh && cd ~/.config/ohmyposh
oh-my-posh config export --format json --output ~/.config/ohmyposh/redmaw.json
vim redmaw.json
```

#### Install eza and cargo

Check if cargo is already installed:
```
cargo --version # should print '1.70.0'
```

If not then install cargo (required for eza):
```
sudo apt update
sudo apt install curl build-essential
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Install eza:
```
cargo install eza
eza --version # should print 'v0.20.12'
```

If you're on macOS, install using homebrew:
```
brew install eza
eza --version # should print 'v0.20.12'
```

#### Install fzf

Check if you have fzf preinstalled, if not install using homebrew:

```
fzf --version # should print '0.56.3'
brew install fzf
```

#### Install zoxide

```
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
```

If you're on macOS, install using homebrew:
```
brew install zoxide
```

#### Finishing off

Open your .zshrc file and match the contents to the repository file:
```
vim ~/.zshrc
```

If you're on Linux or WSL, add the following line under "# PATH":
```
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

If you're on macOS, add the following line instead:
```
eval "$(/opt/homebrew/bin/brew shellenv)"
```

If you didn't already, configure Oh My Posh to use your custom json file:
```
eval "$(oh-my-posh init zsh --config '~/.config/ohmyposh/redmaw.json')"
```

### Step 4

#### Finally setting up neovim

Firstly install fd-find and ripgrep, as they're used by telescope:
```
brew install fd
brew install ripgrep
```

Install neovim:
```
brew install neovim
```
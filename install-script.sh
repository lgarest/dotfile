sudo apt update
sudo apt upgrade 
sudo apt install build-essential

sudo apt install zsh
chsh -s /bin/zsh $USER

cd
mkdir -p dev
git clone https://github.com/lgarest/dotfile

#tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s ~/dev/dotfile/tmux.conf ~/.tmux.conf

# zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -s ~/dev/dotfile/zshrc ~/.zshrc

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install rcmdnk/file/brew-file
brew file install -f ~/dev/dotfile/Brewfile
$(brew --prefix)/opt/fzf/install

# pyenv
pyenv install 3.9.9
pyenv global 3.9.9
cd && mkdir -p venvs && cd venvs
python3 -m venv py3nvim
~/venvs/py3nvim/bin/pip3 install neovim pynvim black


# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
nvm install --lts
nvm alias default 16.13.1
nvm use default
npm install -g neovim prettier

# zoxide
curl -sS https://webinstall.dev/zoxide | bash
Add to ~/.zshrc
eval "$(zoxide init zsh)"

#lcurl
sudo curl \
      -L https://raw.githubusercontent.com/nickjj/lcurl/0.1.0/lcurl \
        -o /usr/local/bin/lcurl && sudo chmod +x /usr/local/bin/lcurl

#git
git config --global pager.branch false
git config --global core.editor "nvim"
github.com/wfxr/forgit

#!/usr/bin/env bash

# locale setup
locale-gen en_IN

# required libraries
apt-get install -y build-essential
apt-get install -y tree
apt-get install -y git

# set git config
git config --global user.name "Your Name"
git config --global user.email email@domain.com
git config --global core.editor "vim"
git config --global core.autocrlf true

# zsh
apt-get install zsh -y

if [ -d /home/vagrant/.oh-my-zsh ]; then
    echo "oh-my-zsh already installed"
else
    # oh-my-zsh
    git clone git://github.com/robbyrussell/oh-my-zsh.git /home/vagrant/.oh-my-zsh
    cp /home/vagrant/.oh-my-zsh/templates/zshrc.zsh-template /home/vagrant/.zshrc
    chsh -s /usr/bin/zsh vagrant
fi

# add path
echo "export PATH=vendor/bin:$PATH"  >> /home/vagrant/.zshrc

# add alias
cat <<EOT >> /home/vagrant/.zshrc
mkcd() {
    mkdir "\$1"
    cd "\$1"
}
alias gpush='git push origin master'
alias cls='printf "\033c"'
EOT

echo 'alias written'

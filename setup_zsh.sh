#!/bin/bash
#
# Prerequisites:
#   - Install zsh
#   - Install a mono spaced nerd font for all icons:
#     https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts
#   - Configure terminal to use the nerd font


# Install Oh My ZSH
echo "Installing zsh..."
echo "Once installed exit with CTRL+D"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Enable command auto correction
#sed -i 's/^# ENABLE_CORRECTION=.*/ENABLE_CORRECTION="true"/' ~/.zshrc

# Install powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
# Wizard options: nerdfont-complete + powerline, small icons, rainbow, unicode,
# slanted separators, sharp heads, flat tails, 2 lines, dotted, left frame,
# dark-ornaments, sparse, many icons, concise, transient_prompt, instant_prompt=verbose.

# Install zsh-completions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

# Install zsh-syntax-highlightning
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install autoupdate-zsh-plugin
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/autoupdate

# Enable all plugins
sed -i 's/^plugins=.*/plugins=(git zsh-completions zsh-syntax-highlighting zsh-autosuggestions autoupdate oc kubectl ansible)\nautoload -U compinit \&\& compinit/' ~/.zshrc

# Fix all permissions
echo "If using WSL, start your zsh and run: compaudit | xargs chmod g-w,o-w"

# TODO: sudo dnf install powerline vim-powerline tmux-powerline powerline-fonts
# TODO or vim-airline
# TODO setup screenrc, vimrc, setup powerline vim, colorful man pages etc.

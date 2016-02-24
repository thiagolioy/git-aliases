# Load rbenv automatically
eval "$(rbenv init -)"
# Load Antigen
source ~/.antigen.zsh

# Load various lib files
antigen bundle robbyrussell/oh-my-zsh lib/

#
# Antigen Theme
#

antigen theme jdavis/zsh-files themes/jdavis

#
# Antigen Bundles
#

antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle rupa/z

antigen bundle gitignore
antigen bundle cp
antigen bundle colored-man-pages
antigen bundle history
antigen bundle command-not-found
antigen bundle djui/alias-tips
antigen bundle peterhurford/git-aliases.zsh
# antigen bundle thiagolioy/git-aliases
# For SSH, starting ssh-agent is annoying
# antigen bundle ssh-agent

# Node Plugins
# antigen bundle coffee
# antigen bundle node
# antigen bundle npm

# Python Plugins
# antigen bundle pip
# antigen bundle python
# antigen bundle virtualenv

# OS specific plugins

antigen bundle brew
antigen bundle brew-cask
antigen bundle gem
antigen bundle osx


# # Tell antigen that you're done.
antigen apply

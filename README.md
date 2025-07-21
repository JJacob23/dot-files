#USING THE GIT REPO#

To tell git to use the home directory as the working tree for the repo in $HOME/dotfiles, use this command to create an alias:
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
Then, anytime you would call git, call dotfiles instead:
dotfiles add .config/nvim/

#Other NeoVim requirements
Lua_LSP installed separately and added to path

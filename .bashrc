## Key remapping
# swap Esc and CAPS
setxkbmap -option caps:swapescape


##  aliases
# vim
alias vi='nvim'
alias vim='nvim'

# apt
alias update='sudo apt-get update && sudo apt-get upgrade -y'
alias install='sudo apt-get update && sudo apt-get install'
alias autoremove='sudo apt-get autoremove'

# jupyter lab
alias jlab='conda activate base; jupyter lab'

# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'

# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# reboot / halt / poweroff
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

# make downloads restartable
alias wget='wget -c'

# clear the screen efficiently
alias c='clear; ls -lha; echo ''; pwd'

# exa for ls
if [ -x "$(command -v exa)" ];
then
  alias ls='exa --icons'
fi
alias ll='ls -laFh'

# set up bat
if [ -x "$(command -v bat)" ];
then
  alias cat='bat'
fi


## Others
# start starship
eval "$(starship init bash)"

# start zoxide
eval "$(zoxide init bash --cmd cd)"

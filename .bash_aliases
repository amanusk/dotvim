######################
### --ALIASES-- ######
######################

alias a='alias'
alias h='history'
alias jobs="jobs -l"
alias ll="ls -alF"
alias g='grep'
alias gc='grep --color'
alias grc='grep -r --color'
alias z='zgrep'
alias l='less'

# Ranger
# alias ranger='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'
# alias r='ranger --choosedir=$HOME/rangerdir; LASTDIR=`cat $HOME/rangerdir`; cd "$LASTDIR"'
alias r='ranger'

# Trash
alias rm="echo 'rm is disabled. Use trash instead'"
alias rmi="/bin/rm -I"


export PINTOOL=/home/amanusk/Software/pin-3.2-81205-gcc-linux
#export PIN=/home/amanusk/Software/pin-3.2-81205-gcc-linux/pin

#####
#VARS
#####


export DEBFULLNAME="Alex Manuskin"
export DEBEMAIL="alex.manuskin@gmail.com"
export GOOGLE_APPLICATION_CREDENTIALS="/home/amanusk/Documents/s-tui-172faa307aad.json"


PATH=~/.local/bin:$PATH

export PATH=$PATH:/usr/local/go/bin
export GOPATH="$HOME/go"
export GOROOT=/usr/local/go

export HISTTIMEFORMAT='%F %T |'
export HISTSIZE=4000
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups:erasedups:ignorespace
export FORCE_COLOR=true
shopt -s histverify

source "$HOME/.bash_prompt.sh"
source "$HOME/.bash_aliases.sh"
source "$HOME/.bash_functions.sh"
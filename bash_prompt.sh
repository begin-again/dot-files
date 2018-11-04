
source "$HOME/.git-prompt.sh" 

Time12h="\T"
PathShort="\w"
Color_Off="\[\033[0m\]"
Green="\[\033[0;32m\]"
Yellow="\[\033[0;33m\]"
Cyan="\[\033[0;36m\]"
Red="\[\033[0;31m\]"


export PS1=$Cyan$Time12h$Color_Off'$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    # Clean repository - nothing to commit
    echo "'$Green'"$(__git_ps1 " (%s)"); \
  else \
    # Changes to working tree
    echo "'$Red'"$(__git_ps1 " {%s}"); \
fi) '$Yellow$PathShort$Color_Off'\n$$ \$ "; \
else \
  # Prompt when not in GIT repo
  echo " '$Yellow$PathShort$Color_Off'\n$$ \$ "; \
fi)'

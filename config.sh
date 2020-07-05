echo "loading dev-config/config.sh"

export HISTIGNORE="ls:cd:git log:pwd:clear:history:ll:exit:node:yarn"
export FWREINIT_SECRET='letmein!'

# Detect if its is a WSL bash environment
if [ -d '/mnt/c' ]; then
    export ROOT="/mnt/c"
    export DEVROOT="$ROOT/Users/hogartht16/projects"
    # WSL will have not loaded the tooling from ~/.bashrc 
    # because it will not have be able to find it as 
    # the WSL root is /mnt/c
    source "$DEVROOT/tooling/shell-tools/bash.sh"
else
    export ROOT="/c"
    export DEVROOT="$ROOT/Users/hogartht16/projects"
fi

export CF11="$ROOT/ColdFusion11/cfusion/wwwroot"
export CF18="$ROOT/ColdFusion2018/cfusion/wwwroot"
export archive="$ROOT/temp/archive"
export ltemp="$ROOT/users/hogartht16/temp"

source "$DEVROOT/dev-config/functions.sh"
source "$DEVROOT/dev-config/aliases.sh"

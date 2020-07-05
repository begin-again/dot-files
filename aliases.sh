echo "  loading alias.sh"

# git
alias fetch='git fetch'
alias ga='git add'
alias gc='git commit -m'
alias gf='git fetch -q origin'
alias gglb='git branch | cut -c3- | git grep $1'
alias ghist='git fetch -q && git log origin/$(git rev-parse --abbrev-ref HEAD)..$(git rev-parse --abbrev-ref HEAD) --format="%s"'
alias git-public='git config user.email begin-again@users.noreply.github.com'
alias gp='git pull -q'
alias gpr='git fetch origin -q "+refs/pull/*/head:refs/remotes/origin/pr/*"'
alias jclean='junk | xargs git branch -D 2>/dev/null'
alias junk="git branch | cut -c3- | egrep -i '^(ti|jm|mfs|rs|ms|aa|pull|pr|jr|xxx)/'"
alias pull='git pull -q'
alias gs='git switch'

# Misc
alias audit='yarn audit'
alias cf-server="less $ROOT/coldfusion2018/cfusion/runtime/conf/server.xml"
alias cfr='curl -c ~/cookie -b ~/cookie "http://localhost:8518/connect_client/index.cfm?fwreinit=$FWREINIT_SECRET" &'
alias code='~/bin/VS-Code/Code.exe'
alias fix-atom="atom --clear-window-state"
alias functions='declare -F | grep -v _git'
alias gulps='find "$DEVROOT" -maxdepth 2 -type f -name build.log -exec ls -l --time-style=long-iso {} \; | cut -d" " -f 6,7,8 | sed "s!/! !g" | cut -d" " -f 1,2,7 | sort'
alias keymd5='ssh-keygen -E md5 -lf'
alias ls='ls -F --color=auto --show-control-chars'
alias meld="~/bin/meld/meld.exe"
alias outdated='yarn outdated'
alias pandoc='~/bin/pandoc/pandoc.exe'
alias pbar='~/bin/pbar/pianobar.exe'
alias temp-size='find /tmp -maxdepth 1 -type d -print | wc -l'
alias smtp4dev='/c/users/hogartht16/bin/smtp4dev/Rnwood.Smtp4dev.exe'

# Information
alias deployables2="node -e \"console.log(require(path.join(process.env.DEVROOT, 'tooling', 'shell-tools', 'common', 'repos.js')).deployableRepos().sort().join('\n') )\""
alias deployables="node $DEVROOT/dev-config/deployables.js | column -t"

# Projects
alias apps="cd $DEVROOT/portalApps;gst"
alias checklist="cd $DEVROOT/app_checklist"
alias client="cd $DEVROOT/connect_client;gst"
alias config="cd $DEVROOT/dev-config;gst"
alias connect="cd $DEVROOT/connect;gst"
alias dash="cd $DEVROOT/dev_dashboard"
alias deploy="cd $DEVROOT/deploy-builder;gst"
alias dev="cd $DEVROOT/dev-guides;gst"
alias docks="cd $DEVROOT/dockerProjects"
alias goals="cd $DEVROOT/goals"
alias js-gh="cd $DEVROOT/js-gh"
alias maint="cd $DEVROOT/maint-tracker;gst"
alias node-bot="cd $DEVROOT/bot-node"
alias policy="cd $DEVROOT/policy;gst"
alias postbox="cd $DEVROOT/app_postbox"
alias root="cd $DEVROOT/root;gst"
alias salary="cd $DEVROOT/salaryAutomation;gst"
alias shared="cd $DEVROOT/shared;gst"
alias template="cd $DEVROOT/app_template;gst"
alias tems="cd $DEVROOT/tems;gst"
alias tooling="cd $DEVROOT/tooling;gst"
alias tooling-dev="cd $HOME/projects_dev/tooling;gst"
alias unit="cd $DEVROOT/ntdg-unit-test;gst"
alias wiki="cd $DEVROOT/wiki;gst"
alias sga="cd $DEVROOT/specialGradingAccommodations;gst"

# Actions
alias dev-alias="vim $DEVROOT/dev-config/aliases.sh"
alias gulp18='yarn gulp --cfhome coldfusion2018'
alias gulp='gulp18'
alias npm-globals='npm list -g --depth=0'
alias resource='. ~/.bash_login'
alias snkmon='snyk --dev --org=ntdg -q monitor'
alias dep='node $DEVROOT/deploy-builder/src/index -a $archive'
alias cfdebug="tail -f $CF18/../logs/todd.log"
alias yaudit='node $DEVROOT/tooling/shell-tools/audit'
alias diff='diff -way --suppress-common-lines '
alias install-lts='nvm list available | head -n4 | tail -n1 | cut -d "|" -f3 | xargs -I{} nvm install {}'
alias install-latest='nvm list available | head -n4 | tail -n1 | cut -d "|" -f2 | xargs -I {} nvm install {}'
alias dep-audit='audit="$(date  +'audit-%Y-%m-%d-%M'.md)";  yaudit > ~/"$audit" && code  ~/"$audit"'
alias rc='rcopy -d $CF18 '

# Docker
alias di='docker image'
alias dc='docker container'
alias dn='docker network'
# export DOCKER_HOST='tcp://0.0.0.0:2375'

# over-rides of shell-tools defaults
alias cb='branches -sfd | column -ts "|"'
alias cbd='branches -sfd | grep \*'
alias devroot='DEVROOT=~/projects_dev'

# mongo
alias m121='mongo "mongodb://cluster0-shard-00-00-jxeqq.mongodb.net:27017,cluster0-shard-00-01-jxeqq.mongodb.net:27017,cluster0-shard-00-02-jxeqq.mongodb.net:27017/aggregations?replicaSet=Cluster0-shard-0" --authenticationDatabase admin --ssl -u m121 -p aggregations --norc'
alias mongo="$ROOT/'Program Files'/MongoDB/Server/4.0/bin/mongo.exe"
alias nod-mongo="cd $DEVROOT/nodeU/node-mongo-foundation"

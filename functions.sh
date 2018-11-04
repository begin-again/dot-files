gref() {
    if [ -n "$1" ]; then
        if [ -d "$HOME/projects/$1" ]; then
            git -C "$HOME/projects/$1" log --walk-reflogs \
                --format="%gd %C(yellow)%h %Cgreen%cd%Cred%d %C(yellow)%gs %Creset%s" \
                --date=format:"%d %b %H:%M"
        else
            echo "Cannot find $HOME/projects/$1"
        fi
    else
        git log --walk-reflogs \
            --format="%gd %C(yellow)%h %Cgreen%cd%Cred%d %C(yellow)%gs %Creset%s" \
            --date=format:"%d %b %H:%M"
    fi
}
export gref

changed() {
    if [ -z "$1" ]; then 
        branch="master"
    else 
        branch="$1"
    fi 
    git diff --name-only HEAD $(git merge-base HEAD "$branch")
}
export changed

checkmerge() {
    if [ -z "$1" ]; then 
        branch="master"
    else 
        branch="$1"
    fi 
    git merge --no-commit --no-ff $branch 
    git merge --abort 
}
export checkmerge


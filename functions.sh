echo "  loading functions.sh"

projects() {
    if [ -n "$1" ]; then
        if [ -d "$DEVROOT/$1" ]; then
            cd "$DEVROOT/$1"
        else
            cd "$DEVROOT"
        fi
    else
        cd "$DEVROOT"
    fi
}

extratemplates(){
    if [ "$1" ]; then
        folder="$1"
    else
        folder="app"
    fi
    if [ -d "$folder" ]; then
        templates=$(find "$folder" -type f -name "*.html")
        found=$(grep -riw --include='*.js' -f <(echo "$templates") app | cut -d":" -f3 | tr -d '"' | tr -d "\'" | sed 's/\.\///' | sort)
        diff -wy --suppress-common-lines <(echo "$templates") <(echo "$found")
    else
        echo "Unable to find folder '$folder'"
    fi
}

# Toggles the extra JS styles= rules
xlint(){

    if [ -f "$DEVROOT/.eslintrc.yaml" ]; then
        mv "$DEVROOT/.eslintrc.yaml" "$DEVROOT/.eslintrc.yaml.hide"
        echo "Disabled"
    elif [ -f "$DEVROOT/.eslintrc.yaml.hide" ]; then
        mv "$DEVROOT/.eslintrc.yaml.hide" "$DEVROOT/.eslintrc.yaml"
        echo "Enabled"
    else
        echo "File not found"
    fi
}
export xlint

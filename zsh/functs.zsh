# git
function git_prepare() {
        if [ -n "$BUFFER" ];
                then
                        BUFFER="git add -A && git commit -m \"$BUFFER\" && git push"
        fi

        if [ -z "$BUFFER" ];
                then
                        BUFFER="git add -A && git commit -v && git push"
        fi

        zle accept-line
}
zle -N git_prepare

# Vi cursor change
function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
                echo -ne '\e[1 q'
        elif [[ ${KEYMAP} == main ]] ||
             [[ ${KEYMAP} == viins ]] ||
             [[ ${KEYMAP} == '' ]] ||
             [[ $1 = 'beam' ]]; then
                echo -ne '\e[5 q'
        fi
}
zle -N zle-keymap-select
zle-line-ini(){
        zle -K viins
        echo -ne '\e[5 q'
}
zle -N zle-line-init
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

# lfcd
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

# Vi keybinds
bindkey -v
export KEYTIMEOUT=1
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# lfcd
bindkey -s '^o' 'lfcd\n'

# git
bindkey '^g' git_prepare

# conda deactivate
bindkey -s '^d' 'conda deactivate\n'

# fzf into nvim
bindkey -s '^e' 'nvim $(fzf)\n'

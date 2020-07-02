# Load modules
autoload -U colors && colors
setopt PROMPT_SUBST

# Symbols and Defaults

git_branch_symbol=''


# Color defined
git_unmerged_color='white'
git_branch_color='grey'
git_unstaged_color='red'
git_staged_color='yellow'
git_clean_color='green'

# Icons
git_modified_symbol='ﲙ'
git_added_symbol=''
git_deleted_symbol=''
git_untracked_symbol=''
git_renamed_symbol=''
git_copied_symbol=''

# Prompt Functions

git_parse () {
        #Taken from github.com/hohmannr/bubblified
        local git_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)

        if [[ -n $git_branch ]]; then
                local git_info="$git_branch_symbol $git_branch"
                local git_symbols=""
                local git_status=$(git status -s 2> /dev/null | awk '{print substr($0,1,2)}')

                local git_unmerged=$(grep -m1 -E -- 'U|DD|AA' <<< $git_status)
                local git_branch_stashed=$(git stash list | grep $git_branch)
                local git_unstaged=$(echo -n $git_status | awk '{print substr($0,2,1)}')

                # Icons
                local git_not_clean=$git_status
                local git_modified=$(grep -m1 'M' <<< $git_status)
                local git_added=$(grep -m1 'A' <<< $git_status)
                local git_deleted=$(grep -m1 'D' <<< $git_status)
                local git_untracked=$(grep -m1 '??' <<< $git_status)
                local git_renamed=$(grep -m1 'R' <<< $git_status)
                local git_copied=$(grep -m1 'C' <<< $git_status)


                # Coloring
                if [[ -n $git_unmerged ]]; then
                        local git_color=$git_unmerged_color
                elif [[ -n $git_branch_stashed ]]; then
                        local git_color=$git_branch_color
                elif [[ -n "${git_unstaged//[$' \t\r\n']}" && -n $git_not_clean ]]; then
                        local git_color=$git_unstaged_color
                elif [[ -z "${git_unstaged//[$' \t\r\n']}" && -n $git_not_clean ]]; then
                        local git_color=$git_staged_color
                else
                        local git_color=$git_clean_color
                fi

                # icons
                if [[ -n $git_modified ]]; then
                            git_symbols="$git_symbols $git_modified_symbol"
                fi
                if [[ -n $git_added ]]; then
                            git_symbols="$git_symbols $git_added_symbol"
                fi
                if [[ -n $git_deleted ]]; then
                            git_symbols="$git_symbols $git_deleted_symbol"
                fi
                if [[ -n $git_untracked ]]; then
                            git_symbols="$git_symbols $git_untracked_symbol"
                fi
                if [[ -n $git_renamed ]]; then
                            git_symbols="$git_symbols $git_renamed_symbol"
                fi
                if [[ -n $git_copied ]]; then
                            git_symbols="$git_symbols $git_copied_symbol"
                fi

                echo -n "%{$fg[$git_color]%}$git_info$git_symbols"
        fi
}

PROMPT='[%{$fg_bold[blue]%}${PWD/#$HOME/~}%{$reset_color%}][$(git_parse)%{$reset_color%}]: '

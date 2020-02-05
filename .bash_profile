# Usefull aliases

alias ls='ls -GFh'
alias cl='fc -e -|pbcopy'
alias rm='rm -i'
alias grep='grep --color=auto'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias ll='ls -al'

cd() { builtin cd "$@"; ls; }

# added by Miniconda3 installer
# export PATH="/Users/rollernt/miniconda3/bin:$PATH"  # commented out by conda initialize

function conda_auto_env() {
  if [ -e "environment.yml" ]; then
    # echo "environment.yml file found"
    ENV=$(head -n 1 environment.yml | cut -f2 -d ' ')
    # Check if you are already in the environment
    if [[ $PATH != *$ENV* ]]; then
      # Check if the environment exists
      conda activate $ENV
      if [ $? -eq 0 ]; then
        :
      else
        # Create the environment and activate
        echo "Conda env '$ENV' doesn't exist."
        conda env create -q
        source activate $ENV
      fi
    fi
  fi
}

export PROMPT_COMMAND=conda_auto_env

alias nvim='~/nvim-osx64/bin/nvim'
export EDITOR='~/nvim-osx64/bin/nvim'
export PS1="\[\e[32m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\[\e[32m\]]\[\e[m\[\e[32m\] ==>\[\e[m\] "

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/rollernt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/rollernt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/rollernt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/rollernt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

bind Space:magic-space

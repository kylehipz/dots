export TERM="xterm-256color"
POWERLEVEL9K_MODE="nerdfont-complete"
#POWERLEVEL9K_MODE="awesome-fontconfig"
POWERLEVEL9K_HOME_ICON="✔"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="↳ "
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR="▶"
#POWERLEVEL9K_OK_ICON="✔ "
#POWERLEVEL9K_FAIL_ICON="✘ "

POWERLEVEL9K_VCS_GIT_BITBUCKET_ICON=' '
#POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
#POWERLEVEL9K_VCS_CLEAN_BACKGROUND='228'
#POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
#POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='228'
#POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='228'
#POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'

# If you come from bash you might have to change your $PATH.
 #export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/kylehipz/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="powerlevel9k/powerlevel9k"
#
ZSH_THEME="robbyrussell"
#POWERLEVEL9K_DISABLE_RPROMPT=true
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="▶ "
#POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""

POWERLEVEL9K_VCS_GIT_ICON=$'\uF113 '

POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="white"
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)

#POWERLEVEL9K_CUSTOM_APPLE_ICON="echo ☕ "
POWERLEVEL9K_CUSTOM_APPLE_ICON="echo  "
POWERLEVEL9K_CUSTOM_APPLE_ICON_BACKGROUND="white"
POWERLEVEL9K_CUSTOM_APPLE_ICON_FOREGROUND="black"
#POWERLEVEL9K_CUSTOM_APPLE_ICON_BACKGROUND="248"
#POWERLEVEL9K_CUSTOM_APPLE_ICON_FOREGROUND="black"

#POWERLEVEL9K_CUSTOM_STATUS_ICON="echo ✔ "
##POWERLEVEL9K_CUSTOM_STATUS_ICON_BACKGROUND=255
##POWERLEVEL9K_CUSTOM_STATUS_ICON_FOREGROUND=0

POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_folders
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_DIR_HOME_BACKGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="white"
#POWERLEVEL9K_VCS_MASTER_BACKGROUND="grey"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
 #ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
 #export UPDATE_ZSH_DAYS=3

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git node vi-mode sudo zsh-syntax-highlighting zsh-autosuggestions)
#alias ls="colorls"
alias v="nvim"
alias t="tmux"
alias tf="terraform"

alias tx="tmuxinator"

bindkey -v
bindkey -s qw '\e'
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"
[ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa_q

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
 alias zshc="nvim ~/.zshrc"
 alias i3c="nvim ~/.config/i3/config"
 alias nvc="nvim ~/.config/nvim/init.vim"
 alias k="kubectl"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
alias phps="nvim ~/.config/nvim/snippets/php.snippets"
alias phpb="nvim ~/.config/nvim/snippets/blade.snippets"
alias pamv="php artisan make:view "
alias lls="colorls"

source $ZSH/oh-my-zsh.sh
alias tm="nvim /home/kylehipz/.tmux.conf"

#cd ~/Desktop
#neofetch
#neofetch --w3m ~/Pictures/w3.jpg

#export WORKON_HOME=$HOME/.virtualenvs
#export PROJECT_HOME=$HOME/Devel
#source /usr/local/bin/virtualenvwrapper.sh


#__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/kyle/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
#if [ $? -eq 0 ]; then
	#\eval "$__conda_setup"
#else
	#if [ -f "/home/kyle/anaconda3/etc/profile.d/conda.sh" ]; then
		#. "/home/kyle/anaconda3/etc/profile.d/conda.sh"
		#CONDA_CHANGEPS1=false conda activate base
	#else
		#\export PATH="/home/kyle/anaconda3/bin:$PATH"
	#fi
#fi
#unset __conda_setup

export PATH="$PATH:$HOME/bin"
DISABLE_AUTO_TITLE="true"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"
#FZF_CTRL_T_COMMAND=
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
#ag -g ""
# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag -g ""'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Python virtual environments
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
# source /usr/local/bin/virtualenvwrapper.sh

# Cuda env
export LD_LIBRARY_PATH=/usr/lib/cuda/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/lib/cuda/include:$LD_LIBRARY_PATH

export PATH=$PATH:/usr/local/go/bin
export GOPATH=/home/kylehipz/go
export PATH=$PATH:$GOPATH/bin
export GOBIN=/home/kylehipz/go/bin
export GO111MODULE=auto
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$PATH:/home/kylehipz/nvim-linux64/bin"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

# alias python=python3

# pnpm
export PNPM_HOME="/home/kylehipz/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
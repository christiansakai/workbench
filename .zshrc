# Path to oh-my-zsh installation
export ZSH=/root/.oh-my-zsh

# No need auto update in Dockerized mode 
DISABLE_AUTO_UPDATE=true

# Set name of the theme to load.
# Look in $ZSH/themes/
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Plugins to load 
# Look in $ZSH/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Don't show username in prompt
DEFAULT_USER=`whoami`

# Override Agnoster theme
# so that the prompt
# doesn't show full directory
prompt_dir() {
  prompt_segment blue black "${PWD##*/}"
}

# Aliases
alias vi='/usr/bin/nvim'
alias vim='/usr/bin/nvim'

# Set terminal color to 256
export TERM='xterm-256color'

# Default editor is nvim
export EDITOR='/usr/bin/nvim'

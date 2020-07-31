# Block ADs and other analytics
export HOMEBREW_NO_ANALYTICS=1 # Disable homebrew analytics
export ADBLOCK=true
export DISABLE_OPENCOLLECTIVE=true
export DO_NOT_TRACK=1 # https://consoledonottrack.com/
export HOMEBREW_NO_ANALYTICS=1
export NG_CLI_ANALYTICS=false # https://github.com/angular/angular-cli/blob/master/docs/design/analytics.md

# Disable shell sessions
export SHELL_SESSIONS_DISABLE=1

# Silent direnv
export DIRENV_LOG_FORMAT=""

# https://0x46.net/thoughts/2019/02/01/dotfile-madness/
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_RUNTIME_DIR=$HOME/.local/share
export XDG_CONFIG_DIRS=/etc/xdg:$XDG_CONFIG_HOME
export XDG_DATA_DIRS=/usr/local/share:/usr/share:$XDG_DATA_HOME

# If FZF is installed and The Silver Searcher I configure fzf to use ag as the
# default command. This makes it faster in searching and also makes use of the
# .gitignore
export FZF_DEFAULT_COMMAND='ag --path-to-ignore $HOME/.agignore --hidden -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"

export HISTSIZE=10000000
export SAVEHIST=$HISTSIZE

# Set PATH
export HOMEBREW_DIR=/usr/local

export PATH="$HOMEBREW_DIR/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.shell:$PATH"

export ZSH_EVALCACHE_DIR=$XDG_CACHE_HOME/zsh

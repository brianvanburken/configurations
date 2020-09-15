# Block ADs and other analytics
export HOMEBREW_NO_ANALYTICS=1 # Disable homebrew analytics
export ADBLOCK=true
export DISABLE_OPENCOLLECTIVE=true
export DO_NOT_TRACK=1 # https://consoledonottrack.com/
export HOMEBREW_NO_ANALYTICS=1
export NG_CLI_ANALYTICS=false # https://github.com/angular/angular-cli/blob/master/docs/design/analytics.md

# If it's been more than this number of seconds since Homebrew was last
# updated, automatically run `brew update` before `brew install`.
# 604800 is 1 week in seconds (60 * 60 * 24 * 7).
export HOMEBREW_AUTO_UPDATE_SECS=604800

# Always cleanup after installing or upgrading
export HOMEBREW_INSTALL_CLEANUP=1

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
export FZF_DEFAULT_COMMAND='ag --path-to-ignore=$HOME/.agignore --hidden -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"

export HISTSIZE=10000000
export SAVEHIST=$HISTSIZE

# Set PATH
export HOMEBREW_DIR=/usr/local

export PATH="$HOMEBREW_DIR/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.shell:$PATH"
export PATH="$XDG_DATA_HOME/miniconda/bin:$PATH"

# Set XDG for tools
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export ZSH_EVALCACHE_DIR=$XDG_DATA_HOME/zsh

export _Z_DATA=$XDG_DATA_HOME/z/z.txt

export ASDF_DEFAULT_TOOL_VERSIONS_FILENAME=$XDG_CONFIG_HOME/asdf/tool-versions
export ASDF_CONFIG_FILE=$XDG_CONFIG_HOME/asdf/asdfrc
export ASDF_DATA_DIR=$XDG_DATA_HOME/asdf

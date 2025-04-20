# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="ys"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

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
HIST_STAMPS="%m/%d/%Y %T"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  direnv # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/direnv
  docker # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker
  golang # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/golang
  # kubectl # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/kubectl
  macos  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/macos
  npm    # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/npm
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR="code --wait --new-window"
fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"






######################################## Begin Alias ########################################

# network proxy
alias proxy_on="export https_proxy=http://127.0.0.1:7890; export http_proxy=http://127.0.0.1:7890; export all_proxy=socks5://127.0.0.1:7890"
alias proxy_off="unset https_proxy; unset http_proxy; unset all_proxy"

# wrap brew command
alias brewup="brew update; brew upgrade; brew autoremove; brew cleanup; brew doctor"

# wrap eza command
alias lf="eza --long --classify --color=automatic --icons --all --group-directories-first --header --modified --created --git --git-repos --time-style=long-iso --no-filesize --no-user"

######################################## End Alias ########################################






######################################## Begin Environment ########################################

# fzf
# https://junegunn.github.io/fzf
export FZF_DEFAULT_COMMAND="fd --color=always --no-ignore-parent --follow --hidden --hyperlink=auto"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS_FILE="$HOME/.config/fzf/.fzfrc"
source <(fzf --zsh)

# zoxide
# https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init zsh)"

######################################## End Environment ########################################






######################################## Begin Prompt ########################################

# zsh-completions
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"

  autoload -Uz compinit
  compinit
fi

# zsh-autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# starship
if (( $+commands[starship] )); then
  # ignore oh-my-zsh theme
  unset ZSH_THEME

  export STARSHIP_CONFIG="$HOME/.config/starship/config.toml"
  eval "$(starship init zsh)"
fi

# iTerm2 Shell Integration
if [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
  source "$HOME/.iterm2_shell_integration.zsh"
fi

######################################## End Prompt ########################################






######################################## Begin Trap ########################################

TRAPINT() {
  # ^C was pressed
}

TRAPQUIT() {
  # ^\\ was pressed
}

TRAPTERM() {
  # a 'kill' command was aimed at this program's process ID
}

TRAPEXIT() {
  # at the end of the script no matter what
}

######################################## End Trap ########################################

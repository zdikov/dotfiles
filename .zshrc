# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -d "$HOME/go/bin" ] ; then
    PATH="$HOME/go/bin:$PATH"
fi

export ZSH="/home/zdikov/.oh-my-zsh"
export PATH="/home/zdikov/.local/bin:$PATH"

# Set name of the theme to load --- if set to "random", it will load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="agnoster" # (this is one of the fancy ones)
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
#ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# unsetopt correct_all
# setopt correct

# Uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"

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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    z
    zsh-syntax-highlighting
    zsh-autosuggestions
    tmux
    fzf
    command-not-found
    ubuntu
    colored-man-pages
    pip
    npm
    zsh-completions
    zsh-interactive-cd
    docker
    hitchhiker
)
source $ZSH/oh-my-zsh.sh
autoload -U compinit && compinit

# User configuration

# Vim shortcuts
bindkey -v

bindkey '^ ' autosuggest-accept
bindkey '^r' fzf-history-widget
bindkey '^t' fzf-cd-widget
export KEYTIMEOUT=1

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=247'
ZSH_AUTOSUGGEST_USE_ASYNC=1

source ~/.zplug/init.zsh
zplug "zsh-users/zsh-history-substring-search"
zplug "changyuheng/fz", defer:1
zplug "rupa/z", use:z.sh
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
# alias :q=exit
alias toggleop=~/scripts/toggle_alacritty_opacity.sh
alias vim=nvim
alias bat=batcat
alias arc=git
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fpath+=${ZDOTDIR:-~}/.zsh_functions


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for Yandex Cloud CLI.
if [ -f '/home/zdikov/yandex-cloud/path.bash.inc' ]; then source '/home/zdikov/yandex-cloud/path.bash.inc'; fi

# The next line enables shell command completion for yc.
if [ -f '/home/zdikov/yandex-cloud/completion.zsh.inc' ]; then source '/home/zdikov/yandex-cloud/completion.zsh.inc'; fi

[ -f "/home/zdikov/.ghcup/env" ] && source "/home/zdikov/.ghcup/env" # ghcup-env

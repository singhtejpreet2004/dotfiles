# ============================================================
# POWERLEVEL10K INSTANT PROMPT — must stay at very top
# ============================================================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ============================================================
# OH MY ZSH
# ============================================================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git gh docker docker-compose
  zsh-autosuggestions zsh-syntax-highlighting zsh-completions
  you-should-use web-search fzf z sudo
  copypath copyfile colored-man-pages
)

source $ZSH/oh-my-zsh.sh

# ============================================================
# HOMEBREW
# ============================================================
eval "$(/opt/homebrew/bin/brew shellenv)"

# ============================================================
# DEVELOPMENT ROOT
# ============================================================
export DEV="$HOME/Development"
export PATH="$DEV/scripts/utils:$DEV/scripts/automation:$PATH"

# ============================================================
# CONDA
# ============================================================
__conda_setup="$($HOME/miniconda3/bin/conda shell.zsh hook 2>/dev/null)"
if [ $? -eq 0 ]; then eval "$__conda_setup"; fi
export CONDA_ENVS_PATH="$DEV/environments/conda"

# ============================================================
# DIRENV — auto-loads .envrc per project folder
# ============================================================
eval "$(direnv hook zsh)"

# ============================================================
# MODERN CLI ALIASES
# ============================================================
alias ls='eza --icons --group-directories-first'
alias ll='eza -la --icons --group-directories-first --git'
alias lt='eza --tree --icons --level=2'
alias cat='bat --style=auto'
alias grep='rg'
alias find='fd'
alias top='btm'
alias vim='nvim'
alias vi='nvim'

# ============================================================
# NAVIGATION
# ============================================================
alias dev='cd $DEV'
alias projects='cd $DEV/projects'
alias de='cd $DEV/projects/data-engineering'
alias be='cd $DEV/projects/backend'
alias ops='cd $DEV/projects/devops'
alias exp='cd $DEV/experiments'

# ============================================================
# GIT
# ============================================================
alias lg='lazygit'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gpl='git pull'
alias gco='git checkout'
alias gcb='git checkout -b'
alias glog='git log --oneline --graph --decorate --all'

# ============================================================
# DOCKER
# ============================================================
alias ldk='lazydocker'
alias dk='docker'
alias dkc='docker compose'
alias dkps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias dkclean='docker system prune -af --volumes'

# ============================================================
# CONDA SHORTCUTS
# ============================================================
function ca() { conda activate "$1"; }
function cenv() { conda env list; }
alias cde='conda deactivate'

# ============================================================
# PRODUCTIVITY FUNCTIONS
# ============================================================

mkcd() { mkdir -p "$1" && cd "$1"; }

note() {
  echo "$(date '+%Y-%m-%d %H:%M') | $*" >> "$DEV/notes/terminal-notes.md"
  echo 'Note saved.'
}
notes() { bat "$DEV/notes/terminal-notes.md"; }

serve() { python3 -m http.server "${1:-8000}"; }

extract() {
  case "$1" in
    *.tar.gz)  tar xzf "$1" ;;
    *.tar.bz2) tar xjf "$1" ;;
    *.zip)     unzip "$1" ;;
    *.gz)      gunzip "$1" ;;
    *) echo "Unknown format: $1" ;;
  esac
}

loadenv() {
  local envfile="$DEV/secrets/${1:-dev}.env"
  if [[ -f "$envfile" ]]; then
    set -o allexport && source "$envfile" && set +o allexport
    echo "Loaded: $envfile"
  else
    echo "Not found: $envfile"
  fi
}

sysinfo() {
  echo "Host:    $(scutil --get ComputerName)"
  echo "Brew:    $(brew list | wc -l | tr -d ' ') packages"
  echo "Conda:   $(conda env list 2>/dev/null | grep -v '#' | grep -c .) envs"
  echo "Docker:  $(docker ps -q 2>/dev/null | wc -l | tr -d ' ') running containers"
  echo "Disk:    $(df -h / | awk 'NR==2{print $3" used / "$2}')"
}

# ============================================================
# FZF
# ============================================================
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--height 40% --border --preview "bat --color=always {}"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ============================================================
# ZOXIDE — smart cd
# ============================================================
eval "$(zoxide init zsh)"
alias cd='z'

# ============================================================
# ATUIN — supercharged history
# ============================================================
eval "$(atuin init zsh)"

# ============================================================
# THEFUCK — fix last command typo (use: fk)
# ============================================================
eval $(thefuck --alias fk)

# ============================================================
# PUEUE — background task queue
# ============================================================
alias pq='pueue'
alias pqs='pueue status'

# ============================================================
# POWERLEVEL10K
# ============================================================
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="$HOME/.local/bin:$PATH"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/tejpreetsingh/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

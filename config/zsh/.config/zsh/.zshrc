# This file is sourced by zsh after .zshenv and .zprofile
# You should is this file for:
# - zsh options
# - key bindings
# - zsh plugins
# - Aliases and functions
# - any prompt configurations

# ===== Performance Profiling (optional) =====
# Uncomment to measure startup time
# zmodload zsh/zprof

# ===== History Configuration =====
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# History options
setopt SHARE_HISTORY              # Share history between sessions
setopt HIST_IGNORE_DUPS          # Don't record duplicate entries
setopt HIST_IGNORE_ALL_DUPS      # Delete old duplicates
setopt HIST_IGNORE_SPACE         # Don't record entries starting with space
setopt HIST_FIND_NO_DUPS         # Don't display duplicates when searching
setopt HIST_SAVE_NO_DUPS         # Don't save duplicates
setopt HIST_REDUCE_BLANKS        # Remove extra blanks
setopt APPEND_HISTORY            # Append to history file
setopt INC_APPEND_HISTORY        # Write to history immediately

# ===== Completion System =====
autoload -Uz compinit

# Performance optimization: only check once a day
# (speeds up shell startup)
compinit -C
# if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  # compinit
# else
  # compinit -C
# fi

# Completion options
zstyle ':completion:*' menu select                          # Interactive menu
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'  # Case-insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"    # Colored completion
zstyle ':completion:*' group-name ''                        # Group completions
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}-- no matches found --%f'

# Speed up completion
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# ===== Directory Navigation =====
setopt AUTO_CD               # Type directory name to cd
setopt AUTO_PUSHD           # Make cd push old directory onto stack
setopt PUSHD_IGNORE_DUPS    # Don't push duplicates
setopt PUSHD_MINUS          # Exchange meaning of + and -

# ===== Plugins (from Homebrew) =====

# Zsh Autosuggestions (Fish-like suggestions)
if [ -f "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  ZSH_AUTOSUGGEST_STRATEGY=(history completion)
  ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
fi

# Zsh Syntax Highlighting (must be loaded last)
if [ -f "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# ===== Development Tools Integration =====

# Direnv - Load directory-specific environments
if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi

# uv - Python package manager completions
if command -v uv &> /dev/null; then
  eval "$(uv generate-shell-completion zsh)"
fi

# fzf - Fuzzy finder
if command -v fzf &> /dev/null; then
  eval "$(fzf --zsh)"
fi

# zoxide - Modern cd replacement
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi


# ===== Aliases =====

# General
# File management with eza
alias l='eza'
alias ll='eza -lA -F always --icons=always -s type'
alias la='ll'
alias tree='l --tree'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Git shortcuts
alias g='git'
alias gs='git status'
alias gp='git pull'
alias gfa='git fetch --all --prune --verbose'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate'
alias gla='git log --oneline --graph --decorate --all'

# Python/uv shortcuts
alias py='uv run python'
alias pytest='uv run pytest'
alias uvr='uv run'
alias uvsync='uv sync'
alias uvlock='uv lock'

# AWS shortcuts
alias aws-whoami='aws sts get-caller-identity'
alias aws-login='aws sso login'

# Kubernetes shortcuts (if using Rancher Desktop)
alias k='kubectl'

# Modern CLI tool alternatives
if command -v bat &> /dev/null; then
  alias cat='bat'
fi

if command -v rg &> /dev/null; then
  alias grep='rg'
fi

if command -v fd &> /dev/null; then
  alias find='fd'
fi

# ===== Functions =====

# Create directory and cd into it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Quick Git commit with message
gcm() {
  git commit -m "$*"
}

# Quick Git add, commit, and push
gacp() {
  git add .
  git commit -m "$*"
  git push
}

# Extract various archive types
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"    ;;
      *.tar.gz)    tar xzf "$1"    ;;
      *.bz2)       bunzip2 "$1"    ;;
      *.rar)       unrar x "$1"    ;;
      *.gz)        gunzip "$1"     ;;
      *.tar)       tar xf "$1"     ;;
      *.tbz2)      tar xjf "$1"    ;;
      *.tgz)       tar xzf "$1"    ;;
      *.zip)       unzip "$1"      ;;
      *.Z)         uncompress "$1" ;;
      *.7z)        7z x "$1"       ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Find process by name
findproc() {
  ps aux | grep -i "$1" | grep -v grep
}

# Python virtual environment info
venv-info() {
  if [ -n "$VIRTUAL_ENV" ]; then
    echo "Virtual environment: $VIRTUAL_ENV"
    python --version
    which python
  else
    echo "No virtual environment active"
  fi
}

# ===== Machine-specific Configuration =====
# Load local configuration if it exists (not tracked in git)
if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi


# Starship prompt (must be at end)
if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

# ===== Performance Profiling Output =====
# Uncomment if you enabled zprof at the top
# zprof
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/jorgealves/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
#compdef op
compdef _op op

# zsh completion for op                                   -*- shell-script -*-

__op_debug()
{
    local file="$BASH_COMP_DEBUG_FILE"
    if [[ -n ${file} ]]; then
        echo "$*" >> "${file}"
    fi
}

_op()
{
    local shellCompDirectiveError=1
    local shellCompDirectiveNoSpace=2
    local shellCompDirectiveNoFileComp=4
    local shellCompDirectiveFilterFileExt=8
    local shellCompDirectiveFilterDirs=16
    local shellCompDirectiveKeepOrder=32

    local lastParam lastChar flagPrefix requestComp out directive comp lastComp noSpace keepOrder
    local -a completions

    __op_debug "\n========= starting completion logic =========="
    __op_debug "CURRENT: ${CURRENT}, words[*]: ${words[*]}"

    # The user could have moved the cursor backwards on the command-line.
    # We need to trigger completion from the $CURRENT location, so we need
    # to truncate the command-line ($words) up to the $CURRENT location.
    # (We cannot use $CURSOR as its value does not work when a command is an alias.)
    words=("${=words[1,CURRENT]}")
    __op_debug "Truncated words[*]: ${words[*]},"

    lastParam=${words[-1]}
    lastChar=${lastParam[-1]}
    __op_debug "lastParam: ${lastParam}, lastChar: ${lastChar}"

    # For zsh, when completing a flag with an = (e.g., op -n=<TAB>)
    # completions must be prefixed with the flag
    setopt local_options BASH_REMATCH
    if [[ "${lastParam}" =~ '-.*=' ]]; then
        # We are dealing with a flag with an =
        flagPrefix="-P ${BASH_REMATCH}"
    fi

    # Prepare the command to obtain completions
    requestComp="${words[1]} __complete ${words[2,-1]}"
    if [ "${lastChar}" = "" ]; then
        # If the last parameter is complete (there is a space following it)
        # We add an extra empty parameter so we can indicate this to the go completion code.
        __op_debug "Adding extra empty parameter"
        requestComp="${requestComp} \"\""
    fi

    __op_debug "About to call: eval ${requestComp}"

    # Use eval to handle any environment variables and such
    out=$(eval ${requestComp} 2>/dev/null)
    __op_debug "completion output: ${out}"

    # Extract the directive integer following a : from the last line
    local lastLine
    while IFS='\n' read -r line; do
        lastLine=${line}
    done < <(printf "%s\n" "${out[@]}")
    __op_debug "last line: ${lastLine}"

    if [ "${lastLine[1]}" = : ]; then
        directive=${lastLine[2,-1]}
        # Remove the directive including the : and the newline
        local suffix
        (( suffix=${#lastLine}+2))
        out=${out[1,-$suffix]}
    else
        # There is no directive specified.  Leave $out as is.
        __op_debug "No directive found.  Setting do default"
        directive=0
    fi

    __op_debug "directive: ${directive}"
    __op_debug "completions: ${out}"
    __op_debug "flagPrefix: ${flagPrefix}"

    if [ $((directive & shellCompDirectiveError)) -ne 0 ]; then
        __op_debug "Completion received error. Ignoring completions."
        return
    fi

    local activeHelpMarker="_activeHelp_ "
    local endIndex=${#activeHelpMarker}
    local startIndex=$((${#activeHelpMarker}+1))
    local hasActiveHelp=0
    while IFS='\n' read -r comp; do
        # Check if this is an activeHelp statement (i.e., prefixed with $activeHelpMarker)
        if [ "${comp[1,$endIndex]}" = "$activeHelpMarker" ];then
            __op_debug "ActiveHelp found: $comp"
            comp="${comp[$startIndex,-1]}"
            if [ -n "$comp" ]; then
                compadd -x "${comp}"
                __op_debug "ActiveHelp will need delimiter"
                hasActiveHelp=1
            fi

            continue
        fi

        if [ -n "$comp" ]; then
            # If requested, completions are returned with a description.
            # The description is preceded by a TAB character.
            # For zsh's _describe, we need to use a : instead of a TAB.
            # We first need to escape any : as part of the completion itself.
            comp=${comp//:/\\:}

            local tab="$(printf '\t')"
            comp=${comp//$tab/:}

            __op_debug "Adding completion: ${comp}"
            completions+=${comp}
            lastComp=$comp
        fi
    done < <(printf "%s\n" "${out[@]}")

    # Add a delimiter after the activeHelp statements, but only if:
    # - there are completions following the activeHelp statements, or
    # - file completion will be performed (so there will be choices after the activeHelp)
    if [ $hasActiveHelp -eq 1 ]; then
        if [ ${#completions} -ne 0 ] || [ $((directive & shellCompDirectiveNoFileComp)) -eq 0 ]; then
            __op_debug "Adding activeHelp delimiter"
            compadd -x "--"
            hasActiveHelp=0
        fi
    fi

    if [ $((directive & shellCompDirectiveNoSpace)) -ne 0 ]; then
        __op_debug "Activating nospace."
        noSpace="-S ''"
    fi

    if [ $((directive & shellCompDirectiveKeepOrder)) -ne 0 ]; then
        __op_debug "Activating keep order."
        keepOrder="-V"
    fi

    if [ $((directive & shellCompDirectiveFilterFileExt)) -ne 0 ]; then
        # File extension filtering
        local filteringCmd
        filteringCmd='_files'
        for filter in ${completions[@]}; do
            if [ ${filter[1]} != '*' ]; then
                # zsh requires a glob pattern to do file filtering
                filter="\*.$filter"
            fi
            filteringCmd+=" -g $filter"
        done
        filteringCmd+=" ${flagPrefix}"

        __op_debug "File filtering command: $filteringCmd"
        _arguments '*:filename:'"$filteringCmd"
    elif [ $((directive & shellCompDirectiveFilterDirs)) -ne 0 ]; then
        # File completion for directories only
        local subdir
        subdir="${completions[1]}"
        if [ -n "$subdir" ]; then
            __op_debug "Listing directories in $subdir"
            pushd "${subdir}" >/dev/null 2>&1
        else
            __op_debug "Listing directories in ."
        fi

        local result
        _arguments '*:dirname:_files -/'" ${flagPrefix}"
        result=$?
        if [ -n "$subdir" ]; then
            popd >/dev/null 2>&1
        fi
        return $result
    else
        __op_debug "Calling _describe"
        if eval _describe $keepOrder "completions" completions $flagPrefix $noSpace; then
            __op_debug "_describe found some completions"

            # Return the success of having called _describe
            return 0
        else
            __op_debug "_describe did not find completions."
            __op_debug "Checking if we should do file completion."
            if [ $((directive & shellCompDirectiveNoFileComp)) -ne 0 ]; then
                __op_debug "deactivating file completion"

                # We must return an error code here to let zsh know that there were no
                # completions found by _describe; this is what will trigger other
                # matching algorithms to attempt to find completions.
                # For example zsh can match letters in the middle of words.
                return 1
            else
                # Perform file completion
                __op_debug "Activating file completion"

                # We must return the result of this command, so it must be the
                # last command, or else we must store its result to return it.
                _arguments '*:filename:_files'" ${flagPrefix}"
            fi
        fi
    fi
}

# don't run the completion function when being source-ed or eval-ed
if [ "$funcstack[1]" = "_op" ]; then
    _op
fi

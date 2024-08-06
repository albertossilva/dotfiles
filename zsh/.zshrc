export DOTFILES="$HOME/.dotfiles"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR=nvim
export VISUAL=nvim

export GPG_TTY=`tty`
export LESS="-XRF" # Beautiful less
export GREP_OPTIONS=--color=always

source ~/.dotfiles/zsh/gruvbox_256palette_osx.sh

# BREW
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$HOME/.nvim/bin:$PATH"

# PLUGIN
source $DOTFILES/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source $DOTFILES/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#ALIASES
source $DOTFILES/zsh/.zsh_aliases
source $DOTFILES/zsh/.zsh_abbreviations

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=black,fg=yellow,bold'

source $DOTFILES/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

source ~/.dotfiles/forgit

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[ -f "/Users/silvaalb/.ghcup/env" ] && source "/Users/silvaalb/.ghcup/env" # ghcup-env


# LOCAL
test -e "${HOME}/.zshrc.local" && source "${HOME}/.zshrc.local"

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# NAVIGATION
setopt AUTO_CD           # Go to folder path without using cd.

setopt AUTO_PUSHD        # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS # Do not store duplicates in the stack.
setopt PUSHD_SILENT      # Do not print the directory stack after pushd or popd.

setopt CORRECT           # Spelling correction
setopt CDABLE_VARS       # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB     # Use extended globbing syntax.

# HISTORY
export HISTSIZE=10000 # Maximum events for internal history
export SAVEHIST=10000 # Maximum events in history file
export HISTFILE=~/.zsh_history

setopt EXTENDED_HISTORY       # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY          # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS       # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS   # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS      # Do not display a previously found event.
setopt HIST_IGNORE_SPACE      # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS      # Do not write a duplicate event to the history file.
setopt HIST_VERIFY            # Do not execute immediately upon history expansion.

setopt COMPLETE_IN_WORD # Complete from both ends of a word.
setopt ALWAYS_TO_END    # Move cursor to the end of a completed word.
setopt PATH_DIRS        # Perform path search even on command names with slashes.
setopt AUTO_LIST        # Automatically list choices on ambiguous completion.
setopt AUTO_PARAM_SLASH # If completed parameter is a directory, add a trailing slash.
setopt EXTENDED_GLOB    # Needed for file modification glob modifiers with compinit
setopt MENU_COMPLETE    # Do not autoselect the first completion entry.

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}

zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# VI MODE
bindkey -v
# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

eval $(thefuck --alias)

export FZF_DEFAULT_COMMAND="fd --type file --hidden --color=auto --exclude .git"
# Fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"

# bun completions
[ -s "/home/alberto/.bun/_bun" ] && source "/home/alberto/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

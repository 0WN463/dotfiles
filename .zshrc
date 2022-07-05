export EDITOR=nvim
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/scripts
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
setopt share_history
unsetopt autocd beep
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/own3d/.zshrc'

autoload -Uz compinit
compinit

PROMPT='%U%F{cyan}%n%u:%F{green} %B%30<..<%~%b %(!.#.>) %f'

alias sudo=doas
alias vim=nvim
alias la="exa -la"
alias grep=rg
alias xclip="xclip -sel clip"
alias cl=clear
alias open=xdg-open
alias cgit='/usr/bin/git --git-dir=/home/own3d/.cfg/.git/ --work-tree=/home/own3d'
alias clip='fc -ln -1 | xclip'
alias feh="feh --auto-zoom --scale-down"

# Import colorscheme from 'wal' asynchronously
(cat ~/.cache/wal/sequences &)

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey "^?" backward-delete-char

bindkey '^U' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
bindkey '^K' autosuggest-accept

key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word

### Plugins
source /home/own3d/.config/zsh_plugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/own3d/.config/zsh_plugin/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/own3d/.config/zsh_plugin/zsh-auto-notify/auto-notify.plugin.zsh

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#FF0000'
ZSH_HIGHLIGHT_STYLES[command]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan,bold'

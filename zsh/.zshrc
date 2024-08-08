# from ohmyzsh
ZSH_CACHE_DIR="$HOME/.zsh_cache"
mkdir -p "$ZSH_CACHE_DIR/completions"
(( ${fpath[(Ie)$ZSH_CACHE_DIR/completions]} )) || fpath=("$ZSH_CACHE_DIR/completions" $fpath)

# inspired by https://github.com/leath-dub/nomyzsh
PLUGINDIR=$HOME/.zsh_plugins
[ ! -d "$PLUGINDIR" ] && mkdir -p $PLUGINDIR
plug() {
	PLUGIN_NAME="${1#*/}"
	SOURCE_NAME="$2"

	[ ! -d "$PLUGINDIR/$PLUGIN_NAME" ] && git clone https://github.com/"$1" $PLUGINDIR/$PLUGIN_NAME
	source "$PLUGINDIR/$PLUGIN_NAME/$SOURCE_NAME"
}

# setup bash completion
alias sudo='sudo -E'
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# load plugins
HYPHEN_INSENSITIVE="true"
plug ohmyzsh/ohmyzsh lib/completion.zsh
plug ohmyzsh/ohmyzsh lib/grep.zsh
plug ohmyzsh/ohmyzsh lib/history.zsh
plug ohmyzsh/ohmyzsh lib/directories.zsh
plug ohmyzsh/ohmyzsh lib/key-bindings.zsh
plug ohmyzsh/ohmyzsh lib/theme-and-appearance.zsh
plug ohmyzsh/ohmyzsh plugins/rust/rust.plugin.zsh

[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# load starship prompt if available, falling back to ohmyzsh theme
if type starship > /dev/null; then
    eval "$(starship init zsh)"
else;
    plug ohmyzsh/ohmyzsh lib/async_prompt.zsh
    plug ohmyzsh/ohmyzsh lib/git.zsh
    plug ohmyzsh/ohmyzsh themes/robbyrussell.zsh-theme
fi

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env

# aliases
alias fork="open -a Fork"
alias rcp="rsync -aP --exclude target --exclude .git --exclude env"

# load local config
[ -f $HOME/.zshrc_local ] && source $HOME/.zshrc_local

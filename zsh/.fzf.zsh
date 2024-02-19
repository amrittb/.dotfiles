# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Auto-completion
# ---------------
source "$HOME/fzf/shell/completion.zsh"

# Key bindings
# ------------
source "$HOME/fzf/shell/key-bindings.zsh"

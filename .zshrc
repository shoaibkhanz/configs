# starship must be installed (on mac: brew install starship)
# Initialize the Starship prompt for the Zsh shell
eval "$(starship init zsh)"

# pyenv must be installed (on mac: brew install pyenv)
eval "$(pyenv init --path)"

# Source the separate zsh files
for file in ~/.zsh/*.zsh; do
  source "$file"
done

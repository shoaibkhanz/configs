# Initialize the Starship prompt for the Zsh shell
eval "$(starship init zsh)"
eval "$(pyenv init --path)"

# Source the separate zsh files
for file in ~/.zsh/*.zsh; do
  source "$file"
done

PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:/Users/shoaibkhan/.local/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/shoaibkhan/.pyenv/versions/miniconda3-latest/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/shoaibkhan/.pyenv/versions/miniconda3-latest/etc/profile.d/conda.sh" ]; then
        . "/Users/shoaibkhan/.pyenv/versions/miniconda3-latest/etc/profile.d/conda.sh"
    else
        export PATH="/Users/shoaibkhan/.pyenv/versions/miniconda3-latest/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


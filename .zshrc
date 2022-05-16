export PATH="/usr/local/mysql/bin:/usr/local/mysql/bin/mysql:/Applications/MacVim.app/Contents/bin:$PATH"

# ------------------------------------------------------------------------
alias gtemp='cd ~/temp'
alias gdesk='cd ~/Desktop'

alias glo='git log --oneline'
alias glg='git log --graph --oneline --all'
alias scaffold='/Users/kxue/Library/Python/3.8/bin/scaffold'
alias venvact='. .venv/bin/activate'
# ------------------------------------------------------------------------
# Git completion and prompt
source ~/.git-completion.bash >/dev/null 2>&1

zstyle ':completion:*:*:git:*' script ~/.git-completion.zsh

fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

source ~/.git-prompt.sh

setopt PROMPT_SUBST ; PS1='%F{red}%n@%m:%F{blue}%1~%F{green}$(__git_ps1) %f\$'

# ------------------------------------------------------------------------
# pyenv settings
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# ------------------------------------------------------------------------
# nvm settings
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

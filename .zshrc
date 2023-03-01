# homebrew
export PATH=/opt/homebrew/bin:$PATH

# -------
# Docker
# -------
# docker composeコマンドを短縮
alias dc='docker compose'
# Dockerイメージのなりすまし、改ざんから保護
# export DOCKER_CONTENT_TRUST=1
# sailがインストールできないので0に変更
export DOCKER_CONTENT_TRUST=0

# ----
# nvm
# ----
export NVM_DIR="${HOME}/.nvm"
[ -s "${NVM_DIR}/nvm.sh" ] && \. "${NVM_DIR}/nvm.sh"
[ -s "${NVM_DIR}/bash_completion" ] && \. "${NVM_DIR}/bash_completion"

# .nvmrcで指定したバージョンに自動で切り替えてプロジェクトをスタートする
# https://qiita.com/cleverdog/items/f50dcff0bc2905816b8e
# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# --------
# flutter
# --------
export PATH="$PATH=:$HOME/flutter/bin"
# fvm
export PATH="$PATH=:$HOME/.pub-cache/bin"

# zshでno match foundとでたときの解決方法
# https://www.wwwmaplesyrup-cs6.work/entry/2020/08/08/030240
setopt +o nomatch

# grepに色を付けると他の色が適応されないのでOFF
# export GREP_OPTIONS='--color=always'
export GREP_OPTIONS='--color=never'

# starship
eval "$(starship init zsh)"

# exa
# exaコマンドをlsに置き換え
if [[ $(command -v exa) ]]; then
  alias e='exa --icons --git'
  alias l=e
  alias ls=e
  alias ea='exa -a --icons --git'
  alias la=ea
  alias ee='exa -aahl --icons --git'
  alias ll=ee
  alias et='exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'
  alias lt=et
  alias eta='exa -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
  alias lta=eta
  alias l='clear && ls'
fi

# zoxide
eval "$(zoxide init zsh)"

# hstr
# HSTR configuration - add this to ~/.zshrc
alias hh=hstr                    # hh to be alias for hstr
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor       # get more colors
bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)

# zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
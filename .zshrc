# PATHの重複を自動除去（入れ子シェルで多重登録されるのを防ぐ。先勝ちで順序は維持される）
typeset -U path PATH

# homebrew
export PATH=/opt/homebrew/bin:$PATH

# Nix（Home Manager の home.packages）。homebrew より優先する
# /etc/zshrc の nix-daemon.sh も追加するが末尾寄りに入るため、brew と同じツールがあると brew が勝ってしまう
export PATH="$HOME/.nix-profile/bin:$PATH"

# ユーザーローカルのバイナリ（claude の native build など）。homebrew より優先する
export PATH="$HOME/.local/bin:$PATH"

# -------
# Docker
# -------
# docker composeコマンドを短縮
alias dc='docker compose'
# Dockerイメージのなりすまし、改ざんから保護
# export DOCKER_CONTENT_TRUST=1
# sailがインストールできないので0に変更
export DOCKER_CONTENT_TRUST=0

# ------
# anyenv（遅延ロード）
# ------
# eval "$(anyenv init -)" は各 env の rehash（shim 再生成）を毎回走らせるため約0.63秒かかる。
# 日常的に必要なのは shims が PATH にあることだけなので、それを静的に設定し、
# *env コマンド本体（shell / rehash サブコマンド用の関数）は初回実行時に初期化する。
# 新しい言語バージョンや gem/pip の実行ファイルを入れた直後は `rbenv rehash` 等を手動で。
export ANYENV_ROOT="$HOME/.anyenv"
export GOENV_ROOT="$ANYENV_ROOT/envs/goenv"
export JENV_ROOT="$ANYENV_ROOT/envs/jenv"
export PYENV_ROOT="$ANYENV_ROOT/envs/pyenv"
export RBENV_ROOT="$ANYENV_ROOT/envs/rbenv"
export TFENV_ROOT="$ANYENV_ROOT/envs/tfenv"

# jenv の shim は JENV_LOADED を見ており、未設定だと実行のたびに警告を stderr へ出す
# （処理自体は継続する）。遅延ロードでは init が走らないので、この2つだけ静的に設定する。
export JENV_SHELL=zsh
export JENV_LOADED=1

# anyenv init - と同じ PATH 順序を静的に再現する
path=(
  "$TFENV_ROOT/bin"
  "$RBENV_ROOT/shims" "$RBENV_ROOT/bin"
  "$PYENV_ROOT/shims" "$PYENV_ROOT/bin"
  "$JENV_ROOT/shims"  "$JENV_ROOT/bin"
  "$GOENV_ROOT/bin"
  "$ANYENV_ROOT/bin"
  $path
  "$GOENV_ROOT/shims"
)

# *env コマンドは初回実行時に本体を初期化する
_anyenv_lazy_init() {
  unset -f anyenv goenv jenv pyenv rbenv 2>/dev/null
  eval "$(command anyenv init -)"
}
for _e in anyenv goenv jenv pyenv rbenv; do
  eval "${_e}() { _anyenv_lazy_init; ${_e} \"\$@\"; }"
done
unset _e

# ----
# nvm（遅延ロード）
# ----
# 起動時に nvm.sh を読むと約1秒かかるため読まない。代わりに default バージョンの bin を
# 静的に PATH へ通すので、node / npm / npx は nvm 初期化なしで即使える。
# nvm コマンド自体と .nvmrc の自動切替は、必要になった時だけ本体を読み込む。
export NVM_DIR="${HOME}/.nvm"

# default バージョンの bin を PATH に追加
() {
  local default_alias
  local -a node_dirs
  [[ -r "$NVM_DIR/alias/default" ]] || return
  default_alias="$(<"$NVM_DIR/alias/default")"
  [[ -n "$default_alias" ]] || return
  node_dirs=( "$NVM_DIR"/versions/node/v${default_alias}*(/Nn) )
  (( $#node_dirs )) && export PATH="${node_dirs[-1]}/bin:$PATH"
}

# nvm コマンドは初回実行時に本体を読み込む
nvm() {
  unset -f nvm
  [ -s "${NVM_DIR}/nvm.sh" ] && \. "${NVM_DIR}/nvm.sh"
  [ -s "${NVM_DIR}/bash_completion" ] && \. "${NVM_DIR}/bash_completion"
  nvm "$@"
}

# .nvmrcで指定したバージョンに自動で切り替えてプロジェクトをスタートする
# https://qiita.com/cleverdog/items/f50dcff0bc2905816b8e
# .nvmrc を見つけた時だけ nvm を初期化する（元は起動のたびに nvm version を呼んでいた）
autoload -U add-zsh-hook
load-nvmrc() {
  local dir="$PWD"
  while [[ -n "$dir" && "$dir" != "/" ]]; do
    if [[ -f "$dir/.nvmrc" ]]; then
      nvm use 2>/dev/null || nvm install
      _NVM_SWITCHED=1
      return
    fi
    dir="${dir:h}"
  done
  if [[ -n "${_NVM_SWITCHED-}" ]]; then
    echo "Reverting to nvm default version"
    nvm use default
    unset _NVM_SWITCHED
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# --------
# flutter
# --------
export PATH="$PATH":"$HOME/fvm/default/bin"
# fvm
export PATH="$PATH:$HOME/.pub-cache/bin"

# zshでno match foundとでたときの解決方法
# https://www.wwwmaplesyrup-cs6.work/entry/2020/08/08/030240
setopt +o nomatch

# grepに色を付けると他の色が適応されないのでOFF
# export GREP_OPTIONS='--color=always'
export GREP_OPTIONS='--color=never'

# starship
eval "$(starship init zsh)"

# eza
# ezaコマンドをlsに置き換え
# 旧 exa は Homebrew から削除されたため、後継の eza に移行した（フラグは互換）。
if [[ $(command -v eza) ]]; then
  alias e='eza --icons --git'
  alias l=e
  alias ls=e
  alias ea='eza -a --icons --git'
  alias la=ea
  alias ee='eza -aahl --icons --git'
  alias ll=ee
  alias et='eza -T -L 3 -a -I "node_modules|.git|.cache" --icons'
  alias lt=et
  alias eta='eza -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
  alias lta=eta
  alias l='clear && ls'
fi

# zoxide
eval "$(zoxide init zsh)"

# 履歴
# 先頭にスペースを付けたコマンドは履歴に残さない
# （以前は hstr を Ctrl-R に割り当てていたが、未インストールで使っていなかったため外した。Ctrl-R は zsh 標準の履歴検索）
setopt histignorespace

# zsh-autosuggestions（Home Manager の nix/packages.nix で入れる。以前は ~/.zsh/ への手動 clone）
[[ -r ~/.nix-profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] &&
  source ~/.nix-profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# conda (baseは自動activateしない)
export CONDA_AUTO_ACTIVATE_BASE=false
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="$PATH:/opt/homebrew/Caskroom/miniforge/base/bin"
    fi
fi
unset __conda_setup

# go
# goenv は anyenv 側（~/.anyenv/envs/goenv）に一本化した。GOENV_ROOT・shims の PATH 登録・
# 遅延ロードのスタブはすべて上の anyenv ブロックで設定済みなので、ここでは何もしない。
#
# 以前はここで GOENV_ROOT=$HOME/.goenv に上書きし、~/.goenv/shims も PATH に追加していた。
# その結果 goenv の shims ディレクトリが PATH に2つ並び、バージョン未設定（= system）かつ
# システムに go が無い状態で goenv-which が互いの shim を呼び合って無限再帰し、
# go コマンドがハングしていた。shims の二重登録は避けること。
# 旧 ~/.goenv は未参照（Go 1.20.1 の重複コピー 262MB を含む。削除可）。

# Laravel Sail
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'

# sbin
export PATH="/opt/homebrew/sbin:$PATH"

# mysql-client
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/hrkbyc/.dart-cli-completion/zsh-config.zsh ]] && . /Users/hrkbyc/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

# Java（jenv 管理）
# 以前は JAVA_HOME を Android Studio 同梱の JBR に固定し、jenv は未設定で遊んでいた。
# brew cask の zulu@21 / @17 / @11 を jenv に登録し、global を 21.0.5 に設定済み。
# java / javac は jenv の shims 経由で解決され、.java-version があるディレクトリでは
# そのバージョンが使われる。
#
# jenv は遅延ロードのため起動時に init が走らず、JAVA_HOME を設定してくれない。
# java/javac の shim は .java-version を自分で読むので問題ないが、Gradle や Maven は
# JAVA_HOME を見るため、追従しないと ./gradlew がプロジェクト指定のJDKで動かない。
# そこで .java-version をファイル探索だけで辿って JAVA_HOME を設定する
# （サブプロセスを起動しないので実質ノーコスト。cd のたびに追従する）。
_jenv_set_java_home() {
  local dir="$PWD" ver=""
  while [[ -n "$dir" && "$dir" != "/" ]]; do
    if [[ -r "$dir/.java-version" ]]; then
      ver="$(<"$dir/.java-version")"
      break
    fi
    dir="${dir:h}"
  done
  [[ -z "$ver" && -r "$JENV_ROOT/version" ]] && ver="$(<"$JENV_ROOT/version")"
  [[ -n "$ver" && -d "$JENV_ROOT/versions/$ver" ]] &&
    export JAVA_HOME="$JENV_ROOT/versions/$ver"
}
add-zsh-hook chpwd _jenv_set_java_home
_jenv_set_java_home

# yarn
# 元は $(yarn global bin) を毎回起動していた（node 起動で約0.28秒）。値は固定なので直接指定する
export PATH="$HOME/.yarn/bin:$PATH"

# direnv
eval "$(direnv hook zsh)"
export AWS_PROFILE=admin

# Unity CLI
. "/Users/hrkbyc/.unity/env"

# 補完の初期化
# 以前は nvm の bash_completion から呼ばれていたが、nvm を遅延ロードにしたのでここで明示的に行う。
# .zcompdump が24時間以内なら検証を省いてキャッシュを使う（約0.3秒短縮）。
# 補完が効かなくなったら `rm ~/.zcompdump` で作り直せる。
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

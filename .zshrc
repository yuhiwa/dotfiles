### .zshrc

# Emacs style key binding
bindkey -e

# エスケープシーケンスを使う。
setopt prompt_subst

if [ "$TERM" = "screen" ]; then
    chpwd () { echo -n "_`dirs`\\" }
    preexec() {
        emulate -L zsh
        local -a cmd; cmd=(${(z)2})
        case $cmd[1] in
        fg)
            if (( $#cmd == 1 )); then
                cmd=(builtin jobs -l %+)
            else
                cmd=(builtin jobs -l $cmd[2])
            fi
        ;;
        %*)
            cmd=(builtin jobs -l $cmd[1])
        ;;
        cd)
            if (( $#cmd == 2)); then
                cmd[1]=$cmd[2]
            fi
        ;&
        *)
            echo -n "k$cmd[1]:t\\"
            return
        ;;
        esac

        local -A jt; jt=(${(kv)jobtexts})

        $cmd >>(read num rest
        cmd=(${(z)${(e):-\$jt$num}})
        echo -n "k$cmd[1]:t\\") 2>/dev/null
    }
    chpwd
fi

source ~/.zsh/prompt/git-prompt.sh

prompt_custom() {
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWSTASHSTATE=1
    local git_branch="$(__git_ps1 "\033[36m[%s]\033[0m")"

    case ${UID} in
        0)
            PROMPT="%B%{[31m%}%~%{[m%}%b $git_branch
$ "
            PROMPT2="%B%{[31m%}%_%{[m%}%b> "
            SPROMPT="%B%{[31m%}%r is correct? [n,y,a,e]:%{[m%}%b "
            ;;
        *)
            PROMPT="%{[34m%}%n@%m%{[m%}:%{[33m%}%~%{[m%} $git_branch
$ "
            PROMPT2="%{[34m%}%_%{[m%}> "
            # RPROMPT="[%{[33m%}%*%{[m%}]"
            SPROMPT="%{[34m%}%r is correct? [n,y,a,e]:%{[m%} "
            ;;
    esac
}

if [ "$TERM" = "screen" ]; then
    precmd() {
        local title=$(basename $(print -P "%~"))
#        screen -X title "$title"
        prompt_custom
    }
else
    precmd() {
        prompt_custom
    }
fi

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# プロンプトのカラー表示を有効
autoload -U colors
colors

# デフォルトの補完機能を有効
autoload -U compinit
compinit

# 補完候補を詰めて表示
setopt list_packed

# 補完候補表示時にbeepを鳴らさない
setopt nolistbeep

# 補完侯補をEmacsのキーバインドで動き回る
zstyle ':completion:*:default' menu select=1

# 補完の時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

setopt hist_ignore_dups # ignore duplication command history
setopt share_history # share command history data

zstyle :compinstall filename '~/.zshrc'

# リダイレクトで上書きする事を許可しない。
setopt no_clobber

# ベルを鳴らさない。
setopt no_beep

# ^Dでログアウトしないようにする。
setopt ignore_eof

# ^Iで補完可能な一覧を表示する。(曖昧補完)
setopt auto_list

# <C-u> <C-d> で履歴検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^U" history-beginning-search-backward-end
bindkey "^D" history-beginning-search-forward-end 

# cdでpushdする。
setopt auto_pushd

# pushdで同じディレクトリを重複してpushしない。
setopt pushd_ignore_dups

# globを拡張する。
setopt extended_glob

# 補完時にヒストリを自動的に展開する。
setopt hist_expand

# ディレクトリ名だけで移動できる。
setopt auto_cd

# rm * を実行する前に確認される。
setopt rmstar_wait

# バックグラウンドジョブが終了したらすぐに知らせる。
setopt no_tify

# 履歴ファイルに時刻を記録
setopt extended_history

# 履歴をインクリメンタルに追加
setopt inc_append_history

# 履歴の共有
setopt share_history

# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
# setopt hist_ignore_all_dups

# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups

# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space

# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify

# set alias

export WORDCHARS=$(echo $WORDCHARS | sed 's/\///')

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -F -G -w"
    ;;
linux*)
    alias ls="ls -F --color=auto"
    ;;
esac

alias la="ls -a"
alias ll="ls -lh"
# alias rm="rm -i"
# alias cp="cp -i"
# alias mv="mv -i"
alias df="df -h"
alias du="du -h"

alias pd="pushd"
alias po="popd"
alias :q="exit"

source ~/.zshrc.local

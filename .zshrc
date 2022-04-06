alias BoostNoteServer="npm run dev:webpack"
alias BoostNoteClient="npm run dev:electron"

alias ss="spin shell"
alias sc="spin code"
alias so="spin open"

export PATH="/opt/homebrew/opt/vim/bin:/opt/homebrew/opt/ruby@2.7/bin:/opt/homebrew/lib/ruby/gems/2.7.0/bin:$PATH"

eval "$(/opt/homebrew/bin/brew shellenv)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }

[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
  fi

byobu



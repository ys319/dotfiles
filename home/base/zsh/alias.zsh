# short
alias q='exit'
alias cls='clear'
alias reload='exec zsh -l'

# cd
alias '..'='cd ..'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -g .......='../../../../../..'

# cd variant
alias md='(){mkdir -p $*;cd $1}'
alias pd='cd $OLDPWD'

# mv
alias mv='mv -i '
alias zmv='noglob zmv -w'

# ls
alias ls='ls --color=auto -h'
alias la='ls -Al'
alias ll='ls -1'
alias lla='ls -A1'

# others
alias sudo='sudo '
alias curl='curl -C -'
alias grep='grep --color=auto'
alias tree="tree -I '.git'"
alias less='less -g -i -M -R -S -F -z -4 -x 4 -j12 '
alias ip='ip --color=auto '

# misc
alias gethub='(){git clone --depth 1 "https://github.com/$1"}'
alias weather='curl -4 wttr.in'
alias bgm="mpv --loop-playlist --no-video "
alias repo='cd "$(ghq root)/$(ghq list|fzf)"'

# date
alias today='date "+%F"'
alias now='date "+%F_%H-%M-%S"'
alias nowi='date --iso-8601="seconds"'

# null
alias -g NUL='>/dev/null 2>&1'
alias -g 1NUL='>/dev/null'
alias -g 2NUL='2>/dev/null'

# enforce
function error() {
  echo $* >&2
}

function debug() {
  $DEBUG && error $*
}

function has() {
  type $* NUL
  local laststatus=$?
  if [[ $laststatus -ne 0 ]]; then
    local missing=($(type $*|grep -E "^(${(j:|:)*}) not"|awk '{print $1}'))
    error "missing: ${(j:, :)missing}"
  fi
  return $laststatus
}

# From mac user
has pbcopy  NUL || alias pbcopy='xclip -selection c'
has pbpaste NUL || alias pbpaste='xclip -selection c -o'
has pbselect NUL || alias pbselect='xclip -selection p -o'

# For mac user
has xdg-open NUL || alias xdg-open='open'

# unar
alias -s {zip,zipx,rar,7z,tar,gz,tgz,bz2,tbz,lzma,xz,txz,lzh,sit,sitx,sea,exe,iso,nsi,msi,cab,iso}=unar

# Multimedia
alias -s {png,jpg,webp,bmp,svg}=xdg-open
alias -s {avi,mp4,ts,mkv,webm}=xdg-open
alias -s {pdf,html,md}=xdg-open

# world time
function zonetime() {
  [[ $# -eq 1 ]] \
    && TZ=$1 date \
    || for timezone in $*
    do
      echo "$timezone\t$(TZ=$timezone date)"
    done
  }
zsh-defer compdef _time_zone zonetime

# chrome
function chrome() { google-chrome-stable $* NUL &; }
function ghrome() { chrome --guest $*; }

function passgen() {
  tr -dc "a-zA-Z0-9~!@#$%^&*_+-=:;,./" </dev/random | head -c "${1:-24}"
}

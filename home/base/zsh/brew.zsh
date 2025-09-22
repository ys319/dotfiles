export HOMEBREW_BINERY="/opt/homebrew/bin/brew"
export HOMEBREW_CACHEFILE="$XDG_CACHE_HOME/homebrew.zsh"
if [[ ! -f "$HOMEBREW_CACHEFILE" || "$HOMEBREW_BINERY" -nt "$HOMEBREW_CACHEFILE" ]]; then
  echo "update: cache/brew"
  $HOMEBREW_BINERY shellenv > $HOMEBREW_CACHEFILE
fi
source "$HOMEBREW_CACHEFILE"
unset HOMEBREW_BINERY HOMEBREW_CACHEFILE

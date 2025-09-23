
# default
bindkey -e

# A-Z|Ctrl
: C-a       && bindkey "^A"      beginning-of-line
: C-h       && bindkey "^H"      backward-kill-word
: C-j       && bindkey "^J"      self-insert
: C-q       && bindkey "^Q"      push-line
: C-w       && bindkey "^W"      backward-kill-word

# Arrows
: Up        && bindkey "${terminfo[kcuu1]:-^[[A}"  up-line-or-history
: Down      && bindkey "${terminfo[kcud1]:-^[[B}"  down-line-or-history
: Right     && bindkey "${terminfo[kcuf1]:-^[[C}"  forward-char
: Left      && bindkey "${terminfo[kcub1]:-^[[D}"  backward-char

: Up        && bindkey "^[OA"    up-line-or-history
: Down      && bindkey "^[OB"    down-line-or-history
: Right     && bindkey "^[OC"    forward-char
: Left      && bindkey "^[OD"    backward-char

# Arrows|Ctrl
: C-Up      && bindkey "^[Oa"    history-search-backward
: C-Down    && bindkey "^[Ob"    history-search-forward
: C-Right   && bindkey "^[Oc"    forward-word
: C-Left    && bindkey "^[Od"    backward-word

: C-Up      && bindkey "^[[1;5A" history-search-backward
: C-Down    && bindkey "^[[1;5B" history-search-forward
: C-Right   && bindkey "^[[1;5C" forward-word
: C-Left    && bindkey "^[[1;5D" backward-word

# Arrows|Shift
: S-Up      && bindkey "^[[a"    beginning-of-line
: S-Down    && bindkey "^[[b"    end-of-line
: S-Right   && bindkey "^[[c"    redo
: S-Left    && bindkey "^[[d"    undo

: S-Up      && bindkey "^[[1;2A" beginning-of-line
: S-Down    && bindkey "^[[1;2B" end-of-line
: S-Right   && bindkey "^[[1;2C" redo
: S-Left    && bindkey "^[[1;2D" undo

# PageUpDn
: PgUp      && bindkey "${terminfo[kpp]:-^[[5~}"    up-history
: PgDn      && bindkey "${terminfo[knp]:-^[[6~}"    down-history

# PageUpDn|Ctrl

# Command
: Ins       && bindkey "${terminfo[kich1]:-^[[2~}"  overwrite-mode
: Del       && bindkey "${terminfo[kdch1]:-^[[3~}"  delete-char

: Home      && bindkey "^[[H"    beginning-of-line
: End       && bindkey "^[[F"    end-of-line

: Home      && bindkey "^[[1~"   beginning-of-line
: End       && bindkey "^[[4~"   end-of-line

: Home      && bindkey "${terminfo[khome]:-^[[7~}"  beginning-of-line
: End       && bindkey "${terminfo[kend]:-^[[8~}"   end-of-line

# Hackable
: C-Delete  && bindkey "^[[3;5~" kill-word

# Fish like return
function accept-line() {
  buf=${BUFFER// /}
  if [[ ${#buf} == 0 ]]; then
    BUFFER=''
    zle reset-prompt
  else
    zle .accept-line
  fi
}
zle -N accept-line
bindkey '^M' accept-line

# Ctrl-Z toggle jobs
function run-fglast {
    fg % NUL
}
zle -N run-fglast
bindkey "^z" run-fglast

# disable feature
disable r
# export CORRECT_IGNORE='_*'
# export CORRECT_IGNORE_FILE='.*'

# autoload
autoload -Uz zmv
autoload -Uz zargs
autoload -Uz colors; colors
autoload -Uz vcs_info
autoload -Uz terminfo
autoload -Uz add-zsh-hook
autoload -Uz select-word-style
autoload -Uz history-search-end

# completion
setopt list_types
setopt menucomplete
setopt numeric_glob_sort
setopt magic_equal_subst
setopt glob
setopt globdots
setopt glob_complete
setopt extended_glob
setopt mark_dirs

# history
setopt histverify
setopt hist_no_store
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt share_history
setopt append_history
setopt extended_history
setopt inc_append_history

# auto
setopt auto_cd
setopt auto_list
setopt auto_menu
setopt auto_param_keys
setopt auto_param_slash
setopt auto_pushd

# out of order option
setopt no_prompt_cr         # disable output "%"
setopt no_prompt_sp         # disable output "%"
setopt always_last_prompt   # less scroll

# others
setopt nocorrect            # disable correct
setopt ignore_eof           # ignore Ctrl-D
setopt interactive_comments # comment in console
setopt no_beep              # No beep
setopt no_flow_control      # do not flow control
setopt no_list_beep         # No beeeep!!
setopt no_nomatch           # force match
setopt noautoremoveslash    # do not auto remove slash
setopt print_eight_bit      # show cjk char
setopt prompt_subst         # calc, subst, func... at PROMPT
setopt pushd_ignore_dups    # ignore dups dir
setopt transient_rprompt    # remove right prompt

# completion
zstyle ':completion:*' completer _oldlist _complete _match _ignored _approximate _prefix
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' recent-dirs-insert both
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' verbose yes
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
_comp_options+=(globdots)

# process
zstyle ':completion:*:processes' command 'ps -ax'
zstyle ':completion:*:processes-names' command 'ps -aeo comm='
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:killall:*:processes-names' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:killall:*' menu yes select

# word char
select-word-style default
export WORDCHARS="?_-.[]~&;!#$%^(){}<>"
zstyle ':zle:*' word-chars ' /=;@:{}[]()<>,|-'
zstyle ':zle:*' word-style unspecified

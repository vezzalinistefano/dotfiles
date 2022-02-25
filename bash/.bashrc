#
# ~/.bashrc
#
# config by Stefano Vezzalini

_checkexec() {
	command -v "$1" > /dev/null
}

# Include local binaries in path
if [ -d "$HOME/.local/bin" ] ; then
	export PATH=$PATH:"$HOME/.local/bin"
fi

# nvim as default editor
if _checkexec nvim; then
    export EDITOR=nvim
fi

# prompt
export PS1="> "

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Enable tab completion when starting a command with 'sudo'
[ "$PS1" ] && complete -cf sudo

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Don't put duplicate lines or lines starting with space in the history.
# See `man bash` for more options.
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it.
shopt -s histappend

# For setting history length see HISTSIZE and HISTFILESIZE in `man bash`.
HISTSIZE=1000
HISTFILESIZE=2000

# Check the window size after each command and, if necessary, update the
# values of LINES and COLUMNS.
shopt -s checkwinsize

# Aliases
# ------------------------------------------------------------------------------

# APT
if _checkexec apt; then
    alias au="sudo apt update"
fi

# Vim/NeoVim
if _checkexec nvim; then
    alias v="nvim"
    alias vi="nvim"
    alias vim="nvim"
elif _checkexec vim; then
    alias v="vim"
    alias vi="vim"
fi

# cd into the previous working directory by omitting `cd`.
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Safer default for cp, mv, rm.  These will print a verbose output of
# the operations.  If an existing file is affected, they will ask for
# confirmation.  This can make things a bit more cumbersome, but is a
# generally safer option.
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -Iv'

# Make ls a bit easier to read.  Note that the -A is the same as -a but
# does not include implied paths (the current dir denoted by a dot and
# the previous dir denoted by two dots).  I would also like to use the
# -p option, which prepends a forward slash to directories, but it does
# not seem to work with symlinked directories. For more, see `man ls`.
alias ls='ls -pv --color=auto --group-directories-first'
alias lsa='ls -pvA --color=auto --group-directories-first'
alias lsl='ls -lhpv --color=auto --group-directories-first'
alias lsla='ls -lhpvA --color=auto --group-directories-first'
. "$HOME/.cargo/env"

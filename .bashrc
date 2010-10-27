# base-files version 3.7-1

# To pick up the latest recommended .bashrc content,
# look in /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benificial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file

echo ~/.bashrc in C:/dab/.bashrc

export PATH="/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:$PATH"

mount --change-cygdrive-prefix /

# Shell Options
# #############

# See man bash for more options...

# Don't wait for job termination notification
set -o notify

# Don't use ^D to exit
set -o ignoreeof

# Use case-insensitive filename globbing
shopt -s nocaseglob

# Make bash append rather than overwrite the history on disk
shopt -s histappend

# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
shopt -s cdspell


# Completion options
# ##################

# These completion tuning parameters change the default behavior of bash_completion:

# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1

# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1

# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1

# If this shell is interactive, turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# case $- in
#   *i*) [[ -f /etc/bash_completion ]] && . /etc/bash_completion ;;
# esac


# History Options
# ###############

# Don't put duplicate lines in the history.
# export HISTCONTROL="ignoredups"

# Ignore some controlling instructions
export HISTIGNORE="[   ]*:&:bg:fg:exit"

# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

#### Borland C Compiler
###export PATH="/c/BCC55/Bin:$PATH"
###export PATH="/c/wxWidgets-2.8.9:$PATH"
###export INCLUDE="C:/wxWidgets-2.8.9/lib/bcc_lib/mswd/wxWidgets-2.8.9/;C:/BCC55/Include;C:/wxWidgets-2.8.9;$INCLUDE"
###export INCLUDE="C:/wxWidgets-2.8.9/include/;$INCLUDE"
###export INCLUDE="/c/wxWidgets-2.8.9/include/;$INCLUDE"
###export LIB="C:/BCC55/Lib;$LIB"

###export PATH="/c/mingw/bin:/c/wxWidgets-2.8.9:$PATH"
###export LIB="/c/MinGW/lib/:$LIB"




# Aliases
# #######

# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.

# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

# Default to human readable figures
# alias df='df -h'
# alias du='du -h'

# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour

# Some shortcuts for different directory listings
# alias ls='ls -hF --color=tty'                 # classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
# alias ll='ls -l'                              # long list
# alias la='ls -A'                              # all but . and ..
# alias l='ls -CF'                              #


# Functions
# #########

# Some example functions
# function settitle() { echo -ne "\e]2;$@\a\e]1;$@\a"; }


# User specific aliases and functions

alias a=alias
alias m=less
alias ccd=pushd
alias cdd=popd

alias ll='ls -al'
alias ls='ls --color=tty -F'

alias rm='rm -i'
alias mv='mv -i'
alias du='du -h'
alias df='df -h'
###alias gvim='/c/Program\ Files/Vim/vim71/gvim.exe'

umask 022

export EDITOR=vim

#export LANG=en_US.cp437
#export LANG=
#export LANG=iso8859-2

#export LOGNAME=dab

export PS1='\[\e]0;[Window $WINDOW] \w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '

export PATH="/c/qt/2009.03/bin:$PATH"
export PATH="/c/qt/2009.03/qt/bin:$PATH"
export PATH="/c/qt/2009.03/mingw/bin/:$PATH"
export QTDIR="/c/qt/2009.03/qt"
export QMAKESPEC="C:/qt/2009.03/qt/mkspecs/win32-g++"


export SVN_EDITOR='"C:/Program Files/Vim/vim71/gvim.exe"'

cd ~/proj/


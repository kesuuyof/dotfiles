autoload -U compinit
compinit
autoload -U colors
colors

# PATHの追加
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# MANPATHの追加
export MANPATH=$MANPATH:/opt/local/man$MANPATH
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# bash history customize
# 重複履歴を無視
export HISTCONTROL=ignoredups 
# 空白から始めたコマンドを無視 
export HISTCONTROL=ignorespace
# ignorespace+ignoredups = ignoreboth 
export HISTCONTROL=ignoreboth
# ヒストリのサイズを増やす。
export HISTSIZE=1000000
# よく使うコマンドは保存しない
export HISTIGNORE="fg*:bg*:history*:cd*:ll*:ls*:pwd*:exit*"

# emacs term color
if [ "$EMACS" ];then
#  export TERM=Eterm-color
#  export TERM=xterm-256color
   export TERM=xterm
fi
#export TERM=xterm-color

# color 
# export LSCOLORS=gafacadabaegedhbhghchd

# alias
alias E='%emacs'
#alias emacs='open -a /Applications/Emacs.app'
alias ll='ls -Gla'
alias ls='ls -G'


#!/bin/sh

SCRIPT_PATH=~/setup

# Erase old setup
awk -f ${SCRIPT_PATH}/erase_my_script.awk < ~/.bashrc > /tmp/.bashrc
cp -f /tmp/.bashrc ~

# Setup shell
cat >> ~/.bashrc << EOF
#My script begin
export LANG=zh_CN.gb18030
export LANGUAGE=zh_CN.gb18030
export LC_ALL=zh_CN.gb18030
export PATH=\${PATH}:/usr/local/sbin:/usr/sbin:/sbin:${SCRIPT_PATH}/utils
export PS1='[\u@\h \W]\$ '
export PS2='> '
export PS4='+ '
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;31'
export HISTTIMEFORMAT='%F %T  '
alias ls='ls -F --color=tty'
alias ll='ls -lF --color=tty'
alias lh='ls -lhF --color=tty'
alias la='ls -alF --color=tty'
alias Df='df -h'
alias Du='du -sh *'
alias Hi='. History'
alias Ps='ps -eo cmd,pid,ppid,user,stime,etime'
alias Co='svn co'
alias Ex='svn export'
alias Ci='svn ci -m ""'
alias Up='svn up'
alias Ad='svn add'
alias Rm='svn rm'
alias Mv='svn mv'
alias Di='svn diff'
alias St='svn status'
alias If='svn info'
alias Lg='svn log -v -l 10'
alias Dc='svn diff -c'
alias Mk='make'
alias Mk8='make -j 8'
alias Mr='make release'
alias Md='make debug'
alias Mc='make clean'
alias Mvc='make veryclean'
alias Tg='ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .'
alias Stg='ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --exclude=boost -f ~/.systags /usr/include/'
alias Utf8='export LANG=zh_CN.utf8 LANGUAGE=zh_CN.utf8 LC_ALL=zh_CN.utf8'
alias vim='vim -p'
alias Diff='diff -y -W 100'
echo; cal; echo
#My script end
EOF

# Setup VIM
mkdir -p ~/.vim
cp -R ${SCRIPT_PATH}/vim/vim/* ~/.vim/
cp -f ${SCRIPT_PATH}/vim/vimrc ~/.vimrc

# Setup top
cp -f ${SCRIPT_PATH}/top/toprc ~/.toprc

# Setup gdb
cp -f ${SCRIPT_PATH}/gdb/gdbinit ~/.gdbinit

#!/bin/sh

SCRIPT_PATH=~/setup

# Erase old setup
awk -f ${SCRIPT_PATH}/erase_my_script.awk < ~/.bashrc > /tmp/.bashrc
cp -f /tmp/.bashrc ~

# Setup shell
cat >> ~/.bashrc << EOF
#My script begin
export LANG=zh_CN.utf-8
export LC_ALL=zh_CN.utf-8
export PATH=${PATH}:/usr/local/sbin:/usr/sbin:/sbin:/Users/yintao/setup/utils
export PS1='[\u@\h \w]$ '
export PS2='> '
export PS4='+ '
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;31'
export HISTTIMEFORMAT='%F %T  '
export DISPLAY=:0.0
export MANPATH=/usr/local/share/man:/usr/share/man
export INFOPATH=/usr/local/share/info:/usr/share/info
alias ls='ls -FG'
alias ll='ls -lFG'
alias lh='ls -lhFG'
alias la='ls -alFG'
alias gdb='LD_BIND_NOW=yes gdb'
alias Df='df -h'
alias Du='du -sh *'
alias Hi='. History'
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
alias Mks='make -f Makefile.static'
alias Mr='make release'
alias Md='make debug'
alias Mc='make clean'
alias Mvc='make veryclean'
alias Tg='ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .'
alias Stg='ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --exclude=boost -f ~/.systags /usr/include/'
alias Gb='export LANG=zh_CN.gb18030 LANGUAGE=zh_CN.gb18030 LC_ALL=zh_CN.gb18030'
alias Utf8='export LANG=zh_CN.utf8 LANGUAGE=zh_CN.utf8 LC_ALL=zh_CN.utf8'
alias vi='vim -p'
alias vim='vim -p'
alias Diff='diff -y -W 100'
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

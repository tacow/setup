#!/bin/sh

SCRIPT_PATH=~/setup

# Erase old setup
awk -f ${SCRIPT_PATH}/erase_my_script.awk < ~/.bashrc > /tmp/.bashrc
cp -f /tmp/.bashrc ~

# Setup shell
cat >> ~/.bashrc << EOF
#My script begin
export LANG=zh_CN.GB18030
export LANGUAGE=zh_CN.GB18030
export PATH=\${PATH}:/usr/local/sbin:/usr/sbin:/sbin:${SCRIPT_PATH}/utils
export PS1='[\u@\h \W]\$ '
export PS2='> '
export PS4='+ '
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;31'
alias ls='ls -F --color=tty'
alias ll='ls -lF --color=tty'
alias lh='ls -lhF --color=tty'
alias Df='df -h'
alias Du='du -sh *'
alias Hi=history
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
alias Mr='make release'
alias Md='make debug'
alias Mc='make clean'
alias Tg='ctags -R .'
#My script end
EOF

# Setup VIM
mkdir -p ~/.vim/plugin
cp -f ${SCRIPT_PATH}/vim/a.vim ~/.vim/plugin
cp -f ${SCRIPT_PATH}/vim/vimrc ~/.vimrc

# Setup top
cp -f ${SCRIPT_PATH}/top/toprc ~/.toprc

# Setup systemtap
mkdir -p ~/stap
cp -f ${SCRIPT_PATH}/stap/* ~/stap

rm -f ~/setup.tgz

# Setup sudoers
MY_NAME=$(whoami)
cat >> /tmp/sudoers.append << EOF
${MY_NAME} ALL=(ALL) ALL
EOF
su -c "cat /tmp/sudoers.append >> /etc/sudoers"
rm -f /tmp/sudoers.append


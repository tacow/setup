#!/bin/sh

SCRIPT_PATH=~/setup

# Setup shell
cat >> ~/.bashrc << EOF
export LANG=zh_CN.GB18030
export PATH=\${PATH}:${SCRIPT_PATH}/utils
export PS1='[\u@\h \W]\$ '
export PS2='> '
export PS4='+ '
alias ls='ls -F --color=tty'
alias ll='ls -lF --color=tty'
alias lh='ls -lhF --color=tty'
alias df='df -h'
alias du='du -sh *'
alias hist=history
alias Ps='ps -eo cmd,pid,user,stime,etime'
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


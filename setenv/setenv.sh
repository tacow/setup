#Logon Actions Example
#Expect: "fmsos@FMSOS-DEV-QUEUE"
#Send: ". ~/yintao/setenv/setenv.sh"
export HOME=/home/fmsos/yintao
SET_ENV_PATH="~/setenv"

export LANG=zh_CN.gb18030
export LANGUAGE=zh_CN.gb18030
export LC_ALL=zh_CN.gb18030
export PS1='[\u@\h \w]\$ '
export PS2='> '
export PS4='+ '
alias ls='ls -F --color=tty'
alias ll='ls -lF --color=tty'
alias lh='ls -lhF --color=tty'
alias la='ls -alF --color=tty'
alias Gb='export LANG=zh_CN.gb18030 LANGUAGE=zh_CN.gb18030 LC_ALL=zh_CN.gb18030'
alias Utf8='export LANG=zh_CN.utf8 LANGUAGE=zh_CN.utf8 LC_ALL=zh_CN.utf8'
alias vi='vim -p -u ${SET_ENV_PATH}/vimrc'
alias vim='vim -p -u ${SET_ENV_PATH}/vimrc'
alias gdb='gdb -x ${SET_ENV_PATH}/gdbinit'

cd

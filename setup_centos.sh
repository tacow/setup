#!/bin/sh

SCRIPT_DIR=$(dirname $0)

# Setup sudoers
MY_NAME=$(whoami)
cat >> /tmp/sudoers.append << EOF
${MY_NAME} ALL=(ALL) NOPASSWD: ALL
EOF
su -c "cat /tmp/sudoers.append >> /etc/sudoers"
rm -f /tmp/sudoers.append

sudo cp -f ${SCRIPT_DIR}/local.conf /etc/ld.so.conf.d/

sudo sh -c "echo 'net.ipv4.tcp_tw_reuse = 1' >> /etc/sysctl.conf"

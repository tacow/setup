#!/bin/sh
if [ $# -lt 1 ]
then
    echo "setup_priv.sh [user]"
    exit
fi

SETUP_USER=$1

cat >> /etc/sudoers << EOF
${SETUP_USER} ALL=(ALL) ALL
EOF


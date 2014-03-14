#!/bin/sh

# Setup sudoers
MY_NAME=$(whoami)
cat >> /tmp/sudoers.append << EOF
${MY_NAME} ALL=(ALL) NOPASSWD: ALL
EOF
su -c "cat /tmp/sudoers.append >> /etc/sudoers"
rm -f /tmp/sudoers.append


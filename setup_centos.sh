#!/bin/sh

# Setup sudoers
MY_NAME=$(whoami)
cat >> /tmp/sudoers.append << EOF
${MY_NAME} ALL=(ALL) NOPASSWD: ALL
EOF
su -c "cat /tmp/sudoers.append >> /etc/sudoers"
rm -f /tmp/sudoers.append

cat >> /tmp/local.conf << EOF
/usr/local/lib/
/usr/local/lib64/
EOF
sudo cp -f /tmp/local.conf /etc/ld.so.conf.d/
rm -f /tmp/local.conf

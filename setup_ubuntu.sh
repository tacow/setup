#!/bin/sh

# Setup sudoers
MY_NAME=$(whoami)
cat >> /tmp/sudoers.append << EOF
${MY_NAME} ALL=(ALL) NOPASSWD: ALL
EOF
su -c "cat /tmp/sudoers.append >> /etc/sudoers"
rm -f /tmp/sudoers.append

# Setup locale
sudo sh -c "echo \"zh_CN.GB18030 GB18030\" >> /var/lib/locales/supported.d/zh"
sudo sh -c "echo \"zh_CN.GBK GBK\" >> /var/lib/locales/supported.d/zh"
sudo sh -c "echo \"zh_CN.GB2312 GB2312\" >> /var/lib/locales/supported.d/zh"
sudo locale-gen

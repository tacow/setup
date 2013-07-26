#!/bin/sh

# Setup locale
sudo sh -c "echo \"zh_CN.GB18030 GB18030\" >> /var/lib/locales/supported.d/zh"
sudo sh -c "echo \"zh_CN.GBK GBK\" >> /var/lib/locales/supported.d/zh"
sudo sh -c "echo \"zh_CN.GB2312 GB2312\" >> /var/lib/locales/supported.d/zh"
sudo locale-gen


#!/bin/bash

cp passwd passwd_new
awk -i inplace -F: '{if ($1=="saned") {sub("/usr/sbin/nologin","/bin/bash")} print $0}' passwd_new
sed -i '/avahi:/s/\/usr\/sbin\/nologin/\/bin\/bash/' passwd_new
awk -i inplace 'BEGIN{FS=":";OFS=":"}{print $1,$3,$5,$7}' passwd_new
sed -i '/daemon/d' passwd_new
awk -i inplace -F: '{if ($2 %2 == 0) {sub($4,"/bin/zsh")} print $0}' passwd_new

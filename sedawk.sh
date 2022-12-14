#!/bin/bash
awk -F: '{if ($1=="saned") {sub("/usr/sbin/nologin","/bin/bash")} print $0}' ./passwd > ./passwd_new
sed -i '/avahi:/s/\/usr\/sbin\/nologin/\/bin\/bash/' ./passwd_new
cp ./passwd_new ./passwd_new2
cut -d : -f1,3,5,7- < ./passwd_new2 > ./passwd_new
rm ./passwd_new2
sed -i '/daemon/d' ./passwd_new
awk -i inplace -F: '{if ($2 %2 == 0) {sub($4,"/bin/zsh")} print $0}' ./passwd_new

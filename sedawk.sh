#!/bin/bash

cp passwd passwd_new

# Change shell for user saned
awk -i inplace -F: 'BEGIN {OFS=":"} $1 == "saned" {$7 = "/bin/bash"} {print}' passwd_new

# Change shell for user avahi
sed -i '/avahi:/s/\/usr\/sbin\/nologin/\/bin\/bash/' passwd_new

# Save only 1, 3, 5 ,7 columns
awk -i inplace 'BEGIN{FS=":";OFS=":"}{print $1,$3,$5,$7}' passwd_new

# Remove all lines containing word daemon
sed -i '/daemon/d' passwd_new

# Change shell for all users with even UID
awk -i inplace -F: 'BEGIN {OFS=":"} $2 %2 == 0 {$4 = "/bin/zsh"} { print }' passwd_new

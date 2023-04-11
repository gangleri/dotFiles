#!/usr/bin/env bash 

sed -i '' '2i\
auth       sufficient     pam_tid.so
' /etc/pam.d/sudo


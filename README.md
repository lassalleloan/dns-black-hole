# DNS Black Hole :: Generate hosts file to block not legitimate DNS request

Author: Loan Lassalle
***

sudo chown username:group directory
-rw-r--r--  1 root  wheel  213 24 jul 19:25 /etc/hosts
-rw-r--r--  1 root  wheel  213 24 jul 19:25 /etc/hosts.bk

Need to rename file *.example
Need to review pre-run with get version without file downloading
Need to review post-run

^(0[.]0[.]0[.]0 (http[s]?:\/\/)?([a-zA-Z0-9_-]*[.])*reddit[.]\w+)$
# $1

^# (0[.]0[.]0[.]0 (http[s]?:\/\/)?([a-zA-Z0-9_-]*[.])*reddit[.]\w+)$
$1

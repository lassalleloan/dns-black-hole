# DNS Black Hole :: Generate hosts file to block not legitimate DNS request

Author: Loan Lassalle
***

Reference: https://github.com/StevenBlack/hosts

sudo chown username:group directory
-rw-r--r--  1 root  wheel  213 24 jul 19:25 /etc/hosts
-rw-r--r--  1 root  wheel  213 24 jul 19:25 /etc/hosts.bk

```
^(0[.]0[.]0[.]0 (http[s]?:\/\/)?([a-zA-Z0-9_-]*[.])*reddit[.][a-zA-Z0-9_-]+)$
# $1
```

```
^# (0[.]0[.]0[.]0 (http[s]?:\/\/)?([a-zA-Z0-9_-]*[.])*reddit[.][a-zA-Z0-9_-]+)$
$1
```

```
sudo log config --mode "private_data:on"
log stream --predicate 'process == "mDNSResponder"' --info
```

```
sudo log config --mode "private_data:on"
log stream --predicate 'process == "mDNSResponder"' --info
```

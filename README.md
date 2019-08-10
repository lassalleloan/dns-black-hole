# DNS Black Hole :: Generate hosts file to block any DNS request

Author: Loan Lassalle
***

## TODO
Readme - .example files, ref to StevenBlack repo
try to find a solution to knwon which domain are contacted

## Purpose


## Description

Reference: https://github.com/StevenBlack/hosts

## Prerequisites

* macOS Mojave 10.14.6 (18G84) or later
* Docker Desktop 2.1.0.1 (37199) or later

## Usage

## How to block domains

The domains you list in the blacklist file are included from the final hosts file.

The contents of this file (containing a listing of additional domains in hosts file format) are appended to the unified hosts file during the update process. A sample blacklist is included, and may be modified as you desire.

The blacklist is not tracked by git, so any changes you make won't be overridden when you git pull this repo from origin in the future.

## How to include your own custom domain mappings

If you have custom hosts records, place them in file `myhosts`. The contents of this file are prepended to the unified hosts file during the update process.

The myhosts file is not tracked by git, so any changes you make won't be overridden when you git pull this repo from origin in the future.

## How to unblock domains

The domains you list in the whitelist file are excluded from the final hosts file.

The whitelist uses partial matching. Therefore if you whitelist google-analytics.com, that domain and all its subdomains won't be merged into the final hosts file.

The whitelist is not tracked by git, so any changes you make won't be overridden when you git pull this repo from origin in the future.

## How to temporarily unblock DNS requests for a specific domain

To temporarily unblock DNS requests for a specific domain, it is recommended to `comment all lines related to that specific domain in the hosts file`. To do this, you must add a hashtag or `#` at the beginning of the lines.  
Due to multiple subdomains for a specific domain, you can use the following regex to find a domain and all its subdomains.

```regex
^(0[.]0[.]0[.]0 ([a-zA-Z0-9_-]+:\/\/)?(([a-zA-Z0-9_-]+[.])*)(reddit[.][a-zA-Z0-9_-]+))$
```

Then, you can use the replace function of your text editor to `add #` at the beginning of the lines using the previous regex and the next string.

```replace-text
# $1
```

After these changes, you must `flush your DNS cache`. To do this, you must execute the following commands in a terminal. These commands only works on a macOS.

```sh
dscacheutil -flushcache; killall -HUP mDNSResponder
```

**Note:** It may be necessary to close all the tabs of your web browsers accessing this domain and its subdomains. In addition, some web browsers need to be restarted to clear their local DNS cache.

When you want to `reverse previous actions and block DNS requests for a specific domain` and subdomains, simply use the following regex to remove the hashtag or # at the beginning of the lines.

```regex
^# (0[.]0[.]0[.]0 ([a-zA-Z0-9_-]+:\/\/)?(([a-zA-Z0-9_-]+[.])*)(reddit[.][a-zA-Z0-9_-]+))$
```

Then, you can use the replace function of your text editor to `remove #` at the beginning of the lines using the previous regex and the next string.

```replace-text
$1
```

After these changes, you must `flush your DNS cache`. To do this, you must execute the following commands in a terminal. These commands only works on a macOS.

```sh
dscacheutil -flushcache; killall -HUP mDNSResponder
```

**Note:** It may be necessary to close all the tabs of your web browsers accessing this domain and its subdomains. In addition, some web browsers need to be restarted to clear their local DNS cache.

### Domains associated with a string

It is not unusual for a website to use other legitimate domains, other than subdomains. That is why you can use the following regex to find other domains that contain the same string.

**Note:** Beware, this regex could allow you to unblock DNS requests to illegitimate or malicious domains.

```regex
^(0[.]0[.]0[.]0 ([a-zA-Z0-9_-]+:\/\/)?(([a-zA-Z0-9_-]+[.])*)([a-zA-Z0-9_-]+reddit[a-zA-Z0-9_-]+[.][a-zA-Z0-9_-]+))$
```

## Location of your hosts file

To modify your current hosts file, look for it in the following places and modify it with a text editor.

macOS: /etc/hosts file.

## Reloading hosts file

Your operating system will cache DNS lookups. You can either reboot or run the following commands to
manually flush your DNS cache once the new hosts file is in place.

| The Google Chrome browser may require manually cleaning up its DNS Cache on `chrome://net-internals/#dns` page to thereafter see the changes in your hosts file. See: https://superuser.com/questions/723703
:-----------------------------------------------------------------------------------------

### macOS

Open a Terminal and run:

sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder

## Miscellaneous

### How to know the domains contacted during web browsing

```sh
sudo log config --mode "private_data:on"
log stream --predicate 'process == "mDNSResponder"' --info
```

```sh
sudo log config --mode "private_data:on"
log stream --predicate 'process == "mDNSResponder"' --info
```

### How to reverse changes made to macOS system files

The only file affected by this program is `/etc/hosts`

```
sudo chown root:wheel /etc/hosts
```

```
ls /etc/hosts*
-rw-r--r--  1 root          wheel      213 24 jul 19:25 /etc/hosts
-rw-r--r--  1 root          wheel      213 24 jul 19:25 /etc/hosts.bk
-rw-r--r--  1 root          wheel        0 17 aoû  2018 /etc/hosts.equiv
-rw-r--r--  1 root          wheel      213 17 aoû  2018 /etc/hosts~orig
```

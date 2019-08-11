# dns-black-hole Dockerfile
#
# author: Loan Lassalle <https://github.com/lassalleloan>

FROM alpine:3.10.1

MAINTAINER Loan Lassalle <https://github.com/lassalleloan>

RUN apk add --no-cache python3 py3-lxml wget \
    && if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi \
    && python3 -m ensurepip \
    && rm -r /usr/lib/python*/ensurepip \
    && pip3 install --no-cache --upgrade pip setuptools wheel \
    && if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi \
    && wget -P /dns-black-hole https://github.com/StevenBlack/hosts/archive/master.zip \
    && unzip -d /dns-black-hole /dns-black-hole/master.zip \
    && rm -f /dns-black-hole/master.zip \
    && pip3 install --user -r /dns-black-hole/hosts-master/requirements.txt

WORKDIR /dns-black-hole/hosts-master/

ENTRYPOINT ["python3", \
    "updateHostsFile.py", \
    "--auto", \
    "--extensions", "fakenews", "gambling", "porn", "social", \
    "--output", "/dns-black-hole/etc"]

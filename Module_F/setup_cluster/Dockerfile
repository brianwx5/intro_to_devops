FROM alpine
ARG ssh_pub_key

# Authorize SSH Host
RUN mkdir -p /$(whoami)/.ssh

# Add the keys and set permissions
RUN echo "$ssh_pub_key" > /$(whoami)/.ssh/authorized_keys
RUN chmod 700 /$(whoami)/.ssh
RUN chmod 640 /$(whoami)/.ssh/authorized_keys

RUN apk add --no-cache openssh
RUN apk add --no-cache openssh-server

RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN echo "PermitEmptyPasswords yes" >> /etc/ssh/sshd_config


RUN passwd -d root
RUN ssh-keygen -A

RUN echo "/usr/sbin/sshd" >> /tmp/start_sshd.sh
RUN chmod 777 /tmp/start_sshd.sh

ENTRYPOINT /tmp/start_sshd.sh; /bin/sh
FROM alpine
ARG ssh_pub_key

# Authorize SSH Host
RUN mkdir -p /$(whoami)/.ssh

RUN touch /$(whoami)/.ssh/authorized_users

# Add the keys and set permissions
RUN echo "$ssh_pub_key" > /$(whoami)/.ssh/authorized_users
RUN chmod -R 755 /$(whoami)/.ssh/

RUN apk add --no-cache openssh
RUN apk add openrc --no-cache
RUN mkdir -p /run/openrc
RUN touch /run/openrc/softlevel
RUN passwd -d root

RUN apk --no-cache add openssh
RUN sleep 5
RUN echo "PermitRootLogin without-password" >> /etc/ssh/sshd_config
RUN /usr/bin/ssh-keygen -A
RUN /usr/sbin/sshd -p 22
RUN sleep 5
RUN netstat -anp
FROM alpine
ARG ssh_pub_key

# Authorize SSH Host
RUN mkdir -p /$(whoami)/.ssh

RUN touch /$(whoami)/.ssh/authorized_users

# Add the keys and set permissions
RUN echo "$ssh_pub_key" > /$(whoami)/.ssh/authorized_users
RUN chmod -R 755 /$(whoami)/.ssh/

RUN apk add --no-cache openssh

RUN echo "PermitRootLogin without-password" >> /etc/ssh/sshd_config
RUN echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
RUN echo "PermitEmptyPasswords yes" >> /etc/ssh/sshd_config
RUN netstat -anp

RUN apk add openrc --no-cache
RUN mkdir -p /run/openrc
RUN touch /run/openrc/softlevel
RUN passwd -d root

#RUN /etc/init.d/sshd status
#RUN /etc/init.d/sshd start


# docker pull alpine
# docker run -i -t -d --name al alpine
# docker exec -it al /bin/sh
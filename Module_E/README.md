# Introduction to Configuration

## Section I - Introduction

`Configuration` is the installation of applicable dependencies onto your target system

For example, if you are a DevOps Engineer and you work in an organization that 
writes a lot of `Java applications`, for the application to be successfully deployed to a container or server,
that resource needs `Java` installed!

This might seem trivial given one of older exercises, if you're on a CentOS server it's just 
`sudo yum install java-1.8.0-openjdk`

Consider the following scenario, I have `n` servers to configure where
`n` is 1000

Is it reasonable that I would log into `n` servers to run one command?
 
Consider the next scenario, I have to upgrade a third of my fleet to Java version 1.9 while
knowing which one(s) are still on 1.8

It starts to get to be a chore at scale!

This is the `configuration problem` how can I operate and configure a fleet of resources at scale effectively,
efficiently and easily


## Section II - Activities Intro

For the next few activities we're going to manually (without a package manager)
install the programming languages `Ruby` and `Go`

## Section II - Activity I - Install Ruby

We're going to build off of this example considerably, please take the time to understand

Consider the script ``Module_E/resources/install_sw.sh``

``` bash
#!/usr/bin/env bash

sudo yum install wget -y
wget -O /tmp/ruby.tar.gz https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.2.tar.gz

cd /tmp
tar -xzf ruby.tar.gz
cd /tmp/ruby-2.6.2


bash configure
make
sudo make install
```

Let's take it line by line, we first use `Yum` to install `wget`, a utility to communicate over `HTTP`

We then use `wget` to download a `tar ball` from the Ruby website and output it to `/tmp`

We then, `cd` into `/tmp` and use `tar -xzf` to "decompress" the `tar ball` 
(if you're familiar with compressed zipped files, its similar)

Now, `cd` into the new `directory` created after decompression, execute the `configure` script,
execute the command `make` (we will look briefly at MakeFiles later) and lastly execute `make install` as `root`

Whew! Go ahead and on your virtual machine give this script a run, once it's finished close that terminal session,
reopen a new one, and type `which ruby`

Hopefully you'll see `/usr/local/bin/ruby`

If that's successful type `ruby -v` and you should see `ruby 2.6.2p47`

**Congratulations** you've executed a configuration script to successfully download and install 
the programming language `Ruby`!

## Section II - Activity II - Install Go Lang (Shell Script)

Review the steps in the link below:

https://golang.org/doc/install#install

Try to download and install `Go lang` on your virtual machine

**Pro Tip** take the code from ``Module_E/resources/install_sw.sh`` and 
modify where you need to for `Go lang`

After you are finished, you can either run the autograder `/resources/go_ag.sh` or 
type `which go` to make sure it's installed properly

**Pro Tip** If you're stuck take a look in `Module_E/resources` for some help

## Section II - Activity III - Install Go Lang (Python Script)

Run the `Go lang` uninstaller under `/resources/*` 

Try to perform the same exercise as Activity II, but instead using Python
 
There are a few ways you can do this

- Create a Python script that executes your shell script from Activity II
- Create a Python script that runs shell commands, and transplant your shell
code to Python
- Create a Python script that uses a mix of shell commands and Python libraries

The outline above is listed by difficulty, pick what's the easiest for you

The gist is to get you familiar with multiple scripting languages, so that you can
eventually develop a preference 

How can I run shell commands through Python?
https://docs.python.org/3/library/subprocess.html

## Section III - Docker & Configuration

`Docker` allows you to create `containers`, `containers` can be thought of
as lightweight `virtual machines` that can live on a host `operating system`

You can theoretically have an infinite amount of `containers` on your course virtual machine
if your computer has enough CPU, RAM, etc

Some of my favorite links on `containers`

- https://engineering.squarespace.com/blog/2017/understanding-linux-container-scheduling
- https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/resource_management_guide/ch01
- https://docs.docker.com/engine/docker-overview/


## Section III - Activity I - Install Docker

Feel free to run these commands by hand or create a script

```bash
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce -y
sudo usermod -aG docker $(whoami)
sudo systemctl enable docker
```

Validate the install 

```bash
which docker
sudo systemctl status docker
docker
```

## Section III - Activity II - Use Docker

We're going to use docker to pull down an `image` an `image` can be
thought of as a snapshot of an operating system. `Images` can then be used
to instantiate `containers`

https://hub.docker.com/_/alpine

Download the latest [Alpine Linux](https://alpinelinux.org/) Container
```bash
docker pull alpine
```
List locally downloaded docker images
```bash
docker image ls
```
Create a docker container from the alpine image named ``al``
```bash
docker run -i -t -d --name al alpine
```

**Pro Tip** the `-d` flag runs the docker container as a daemon or in the background,
try running the command without the `-d` to understand 
the behavior 

List running containers
```bash
docker ps
```

Enter into the container
```bash
docker exec -it al /bin/sh
```

We're entering the container by name, follow the screenshot below
you should get similar output by running `whoami`, `uname -a`, and `ls -alt`

![Alt text](./resources/ss32.png?raw=true)

Type `exit` to leave the container

To stop the container from running and check that it's done:
```
docker stop al
docker ps
```

**Congratulations** you have **downloaded**, **started** and **entered into** 
a ``container``!

## Section III - Activity III - Configure a Container

Generally, you're going to configure a container with a `Dockerfile`
but, for this and subsuquent exercises we're going to use `containers`
as a mechanism by which we can learn strategies to solve the `configuration problem`

We're going to hand configure a `container` to be able to be reached
via `SSH`

Let's get al back online 

```
docker start al
```

Let's get `al`'s ip address

```bash
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' al
```

Enter `al`
```bash
docker exec -it al /bin/ash
```

(**Container**)
- Install OpenSSH
- Make the root user password **blank**
```bash
apk add --no-cache openssh
passwd -d root
```

Exit the container by typing `exit`

(**Host**)

On the `host` OS (CentOS) let's create a SSH key, don't set a passphrase!

```bash
ssh-keygen -f ./al-key -t rsa -N ''
```
(**Host**)

Copy and paste this output to a notepad (this is the public key)
```bash
cat al-key.pub
```
(**Host**)

Enter `al` again
```bash
docker exec -it al /bin/ash
```

(**Container**)

- Create a new directory
- Create an `authorized_keys` file
- Install `Vim`
- Copy and paste the `public key` into vim, while it has `/root/.ssh/authorized_keys`
open
- Change the permissions of a directory and a file
```bash
mkdir -p /root/.ssh
touch /root/.ssh/authorized_keys
apk add --no-cache vim
vim /root/.ssh/authorized_keys
chmod 700 /root/.ssh
chmod 640 /root/.ssh/authorized_keys
```


(**Container**)

- Allow root `ssh` access
- Allow `ssh` access for users with empty passwords
```bash
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo "PermitEmptyPasswords yes" >> /etc/ssh/sshd_config

```

(**Container**)

- Generate Keys for ``sshd``
- Start the ``sshd`` service
```
ssh-keygen -A
/usr/sbin/sshd
```

Exit the container by typing `exit`

(**Host**)

Now try to **SSH** into `al`
```bash
ssh -i al-key root@$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' al)
```
You should see output similar to below

![Alt text](./resources/ss33_2.png?raw=true)

**Wow** you've just set up SSH on a container and SSH'd into it, this will serve as the building block
for ``Module F``!
## Section III - Docker & Configuration - Review

- What is [Docker](https://opensource.com/resources/what-docker)?
- How fun is it to run all of these commands by hand?
- What is [ssh](https://www.wikiwand.com/en/Secure_Shell)?
- Can you `ssh` using a key?
- Can you `ssh` without a password?
- Is `sshd` a service? 
- What port does `sshd` bind by default?
- What layer of the OSI model does `ssh` operate within?


## Introduction to Configuration - Reflection

Let's revisit one of the earlier sections

Consider the script ``Module_E/resources/install_sw.sh``

``` bash
#!/usr/bin/env bash

sudo yum install wget -y
wget -O /tmp/ruby.tar.gz https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.2.tar.gz

cd /tmp
tar -xzf ruby.tar.gz
cd /tmp/ruby-2.6.2


bash configure
make
sudo make install
```

Before we could begin to install `Ruby` we installed a utility `wget` 
to assist with HTTP getting the `Ruby` resources

I brought this up to illustrate how `configuration` can be this lego-like 
process, where you need to perform an action **before** you can perform another

Another example of this

```bash
touch /tmp/random/folder/file.txt
```

If the directory ``/tmp/random/folder/`` doesn't exist you
have to create it first ``mkdir -p /tmp/random/folder/``

This extends into `users`, `groups`, and `services` 

The gist is be wary of **how** whatever you're configuring works and **what**
steps you have to take sequentially! 

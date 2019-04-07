# Introduction to Configuration

## Section II - Introduction

`Configuration` is the installation of applicable depdencies onto your target system

For example, if you are a DevOps Engineer and you work in an organization that 
writes a lot of `Java applications`, for the application to be successfully deployed to a container or server,
that resource needs `Java` installed!

This might seem trivial given one of older exercises, if you're on a server it's just 
`sudo yum install java-1.8.0-openjdk`

Consider the following scenario, I have `n` servers to configure where
`n` is 1000

Is it reasonable that I would log into `n` servers to run one command?
 
Consider the next scenario, I have to upgrade a third of my fleet to Java version 1.9 while
knowing which one(s) are still on 1.8

It starts to get to be a chore at scale!

This is the `configuration problem` how can I operate and configure a fleet of resources at scale effectively,
efficiently and easily


---


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
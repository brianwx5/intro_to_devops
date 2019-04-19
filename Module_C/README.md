# Linux Scripting and Operating Systems


## Section I - Introduction

The previous section had you use `vi` or `vim` to write scripts. 

This is an important skill to have because sometimes you may not have an IDE available 
and you want to automate a task **quick and dirty** or for **functionality testing**.

**Stay away from quick and dirty solutions**, generally you want to ensure that your code
is saved in source control, such as Git/GitHub, such that you can for example `git pull` your
`repo` onto a server or a virtual machine and execute it. 


- ***Refresher***: Generally, do scripts have an "explict" compile step
- ***Refresher***: Why are you able to pull script's source code from from a repository and generally
just execute it? 

Always apply good software development practices to your scripts!

For our purposes, it's okay to do what we're doing since we're learning, but folks in this business can
relay horror stories.

- https://www.theregister.co.uk/2015/01/17/scary_code_of_the_week_steam_cleans_linux_pcs/
- https://alkarn.github.io/2017-01-21-bash-scripting-horror/



## Section II - Activity I - CentOS Setup IDE

We're going to install PyCharm and use that to different scripts in the subsequent activities.

To reiterate the sentiments in the introduction, be sure to test your scripts on resources
you are comfortable with "breaking." 

We're working on our own virtual machine so, if 
it breaks we can simply rebuild it, no harm done.


- https://www.jetbrains.com/help/pycharm/install-and-set-up-pycharm.html


[![IMAGE ALT TEXT HERE](http://i3.ytimg.com/vi/96_miUTGhW8/hqdefault.jpg)](https://www.youtube.com/watch?v=96_miUTGhW8)



## Section III - Linux Exit Codes


Linux communicates a command's success through an ``Exit Code``

Let's take a look at the auto grader for Module A

```bash
which tree > /dev/null 2>&1

if [ $? -ne 0 ]; then

    echo "tree is not installed, install tree"

    exit 1

fi
```

Line 1:
```bash
which tree
```
 
 We're executing the command ``which tree``, this will attempt to find the command ``tree`` under 
 `/bin, /usr/bin, etc`

Line 2:
```bash
if [ $? -ne 0 ]
```

The command ``$?`` will return the exit code of the previous command

Therefore, if the previous command's exit code is not 0

(``0 means success``), then
we will:

```bash
echo "tree is not installed, install tree"

exit 1
```

We then exit the script with a exit code of 1, denoting there was an error along the way


**Resources**
- http://www.tldp.org/LDP/abs/html/exitcodes.html

## Section IV - Linux Processes & Fork vs. Exec

A ``process`` is an instance of a running application

Think about using a web browser such as Edge or Google Chrome, this is an application

When you click on your web browser's icon, a ``process`` executes and becomes the currently running
application!

Every ``process`` has a ``PID`` or ``Process Identifying Number``

``Fork`` and ``Exec`` are two ways a ``process`` can be brought to life!


``Fork`` makes a duplicate of a currently running process, essentially a clone

``Exec`` replaces the currently running process with a new process

Keep this distinction in mind if when you are attempting to understand
how a `service` starts or even your own applications

## Section V - Channels & Sockets

`Linux` communicates over streams (that are actually just file descriptors, 
that are actually just sockets), let's review a few

- `stdin`
- `stdout`
- `stderr`

`stdout` is what you see when you execute the command `echo "Hello World"`

`stderr` is what you see when you execute the command `ech "Hello World"`

`stdin` is what you see when you're prompted in your shell session to input
text


## Section VI - Signals (IPC) - Interprocess Communication

**Processes** within Linux can communicate via **signals**

Consider the following code snippet

``` bash
while true; do sleep 10; echo "Hello World"; done &
[1] 4880
~ $Hello World
kill -9 4880
```
We're create an infinite loop that prints Hello World

The ampersand denotes start this process or command in the background

The backgrounding of the process yields the ``job`` number and the process's ``PID``

The command ``kill -9 4880`` send a ``kill signal`` to the process 4880, stopping the infinite loop in it's tracks!

This is a simple example of how you can use signals to communicate with a process.

Another example is using `exit codes` when a `process` fails to start it can
return a `non 0 exit code` to the parent `process` that attempted
to spawn it, signifying that the `child process` had trouble starting


**Resources**
- http://man7.org/linux/man-pages/man7/signal.7.html
- https://www.wikiwand.com/en/Signal_(IPC)
- https://unix.stackexchange.com/questions/317492/list-of-kill-signals


## Section VII - Daemons

"A `daemon` is a long-running background process that answers requests for services. 
The term originated with Unix, but most operating systems use daemons in some form or another. In Unix,
the names of daemons conventionally end in "d". Some examples include `inetd`, `httpd`, `nfsd`, and `sshd`."
[https://kb.iu.edu/d/aiau]

In later sections to set up `clusters` we're going to have to ensure
the `sshd daemon` is up and running before we can `ssh` into one of the `cluster's resources`

**Resources**
- [Daemons](http://www.linfo.org/daemon.html)
- [Daemons](https://bash.cyberciti.biz/guide/Daemons)

## Section VIII - Jobs

We're going to revisit some code again

Consider the following code snippet

``` bash
while true; do sleep 10; echo "Hello World"; done &
[1] 4880
~ $Hello World
kill -9 4880
```

The ampersand denotes start this process or command in the background

The value `[1]` states that this is `Job` 1 and the `4880` corresponds
to the `PID` of that paricular job

I really liked this [post](https://unix.stackexchange.com/questions/4214/what-is-the-difference-between-a-job-and-a-process)
with regards to the difference between a `Job` and a `Process`

For our purposes, understand that you can execute commands, scripts, processes
with `&` as the suffix and it won't "lock" your shell session
into watching execution

A good hands on example would be to execute the code snippet above
without the `&` you would have an infinite loop printing "Hello World"
forever until you stopped it

`Jobs` can controlled for example using the `fg` and `bg` commands

[Here's](https://www.thegeekdiary.com/understanding-the-job-control-commands-in-linux-bg-fg-and-ctrlz/)
a good article talking about `Jobs` to review to help the concept sink in

For our purposes, sometimes you might need to execute multiple long running
tasks in your shell session, but do other work in the meantime. `Jobs`
could potentially be a solution

## Section IX - Activity 1 - Linux Scripting and Operating Systems


Consider the following code from `/Module_C/scripts/start.sh`

```bash
#!/usr/bin/env bash

$(which python) ./status_code.py


exit_code=$?

echo "Shell Script Received Final Exit Code - [$exit_code] from Python"

### Your code goes here ###


### Your code goes here ###

echo "$exit_code"
```

If you run this script, you're going to see this shell script
execute `status_code.py`

`status_code.py` will randomly select and exit it's execution with a 
particular `status code` between **0 and 2**

Within `start.sh` your task is to `echo` "Okay" if the exit code is `0` and `echo` "Not Okay"
if the exit code is `< 0`


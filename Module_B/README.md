# Introduction to Operating Systems (Part II)


## Section I - Scripting

In the previous module we explored basic command line navigation including, 
``creating directories``, ``copying & moving files``, and ``executing the autograder.``

Imagine if instead of typing and executing each of these commands into the shell, we
save these commands to a file and execute the file instead. This is exactly what a [script](https://www.wikiwand.com/en/Scripting_language) is!


### Scripting & Programming Languages

There are many languages you can write ``code`` in to perform a set of tasks. 
Some languages require an explicit compile step like ``Java`` or ``C``, whereas others like
``Python`` and ``Ruby`` "don't." 

This leads us to our first activity of this module.

### Section I - Activity I - Executing Code

For this activity we're going to explore the different execution mechanisms of code on an 
operating system first-hand. For this activity we will provide the steps:

- Within the repo navigate to ``Module_B/s1a1-executingcode``
- You will see ``hello_world.py`` and ``HelloWorld.java``
- Execute `hello_world.py`

Before executing hello_world.py we will ``check if Python is installed``:

```
which python
```

- ***Refresher***: What does **which** do?
- ***Refresher***: What does the successful execution of **which** look like?

Check the Python Version:
```bash
python --version
```

Scripting and programing languages have different version numbers corresponding to a release. Each release can
optimizing existing and or add/remove functionality.


- [Python 2 vs. Python 3](https://learntocodewith.me/programming/python/python-2-vs-python-3/)
- [Python Release History](https://www.wikiwand.com/en/History_of_Python)
- [Java Release History](https://www.wikiwand.com/en/Java_version_history)


Now that we have verified Python's existence on our OS we can attempt to 
execute ``hello_world.py``.

This was a bit of an exercise in futility because CentOS uses ``yum`` to install packages 
if you remember doing the activity in the last module. 

`Yum` is written in Python! 

Depending on what OS 
you are running on it's good to check the release number/version of the programming languages installed because 
you may run into compatibility issues with your code.

Files ending in ``.py`` are ``Python`` files that can be executing by explicitly writing:

```bash
python <file.py>
```

Execute ``hello_world.py``
```bash
python hello_world.py
```

![Alt text](./resources/ss_activity_i.png?raw=true)

Now we're going to execute the ``Java``, like we talked about before there is an 
explicit ``compile`` step we have to execute before we're able to run our ``Java`` code.

Before we compile and run our ``Java`` we have to make sure it's installed

```
which java
```

If we notice that ``Java`` is not already installed, execute:

```bash
sudo yum installed java-1.8.0-openjdk
```

- What is a [JDK](https://www.wikiwand.com/en/Java_Development_Kit)?

</br>


Compiling a ``Java`` file
```bash
javac <file.java>
```
Compile `HelloWorld.java`
```bash
javac HelloWorld.java
```

Execute the Java ``HelloWorld``

```bash 
java HelloWorld
```

![Alt text](./resources/ss_activity_i2.png?raw=true)

- [Why did we omit the Java file's full name?](https://stackoverflow.com/questions/17703461/why-dont-we-use-the-class-extension-with-java-command)

#### Activity I Troubleshooting

- If you cannot ***execute*** a file, it's okay (maybe the script isn't ***executable*** hint hint)
- If you cannot ***install java***, try ``sudo yum install jdk``

### Section I - Activity I - Knowledge Mastery

- What is the difference between a compiled and interpreted language?
- What scripting languages exist for Linux?
- What are: Bash, Sed, Awk, Perl, Python, Ruby, C Shell

### Section I - Activity I - Recap

We dove into executing ``Python`` and ``Java`` code that essentially performed the same task, printing ``Hello World!``.

We saw that ``Python`` took less steps than ``Java`` to execute.

In general this is the **property of scripting languages**, they are dynamically compiled/interpreted, whereas
other programming languages have explict compile steps.

- [Deeper Inspection into Complication and Interpretation](https://medium.com/basecs/a-deeper-inspection-into-compilation-and-interpretation-d98952ebc842)

Regardless of how you run the code, ``Python`` and ``Java`` can perform the same tasks, whether that be to 
create an enterprise application OOP style, or execute shell commands.

The gist is pick the right tool for the job, and if your use case is to automate command line commands, you're best bet would probably 
be to use a **scripting language**.

## Section II - More Scripting

In this section we're going to pit ``Bash``scripts directly against ``Python`` scripts!

Before we continue we want to highlight something called an **execution context**.

The ``execution context`` or ``environment`` of a script consists of attributes such as:

- The ***user*** executing the script
- The permissions of the user executing the script
- The group of the user executing the script
- The permissions of the user executing the script
- The **environment variables** exposed to the current ***session*** you are interacting with
- The current directory you are in
- The processes that are currently running

If you noticed in previous exercises, you cannot `` yum install`` a package without prefixing the command with ``sudo``.

- [What is sudo](https://www.linux.com/learn/linux-101-introduction-sudo)

This is because the ***user*** you were did not have the ***permissions*** to install a package.


When you are within a ``directory``, you can access files within that ``directory`` using dot-slash notation 
``./``

![Alt text](./resources/ss_section_ii.png?raw=true)

This is because your environment knows where you are located, this can be checked 
by executing ``pwd``.

These are two small examples, but the takeaway is to **be aware that your environment is going to influence 
how your scripts are going to execute**. 

Maybe the user you execute a script as
may not have permissions to access a directory. 

Maybe you hard coded your script to access a file using dot-slash notation, but the script isn't
actually executing within that directory and you need to ``cd`` there first.

**Beware of your execution context or environment!**


### Section II - Activity I - Simple Bash Script

- Write a bash script named ``hello_world.sh`` that will output "Hello World!" ``N`` times based on a numerical input param


```bash
bash hello_world.sh 2

"Hello World!"
"Hello World!"
```

### Section II - Activity II - Simple Python Script

- Write a Python script named ``hello_world.py`` that will output "Hello World!" ``N`` times based on a numerical input param

```bash
python hello_world.py 2

"Hello World!"
"Hello World!"
```

### Section II - Activity III - Performance Test

- Copy ``hello_world_performance.sh`` to the same ``directory`` as ``hello_world.sh`` and ``hello_world.py``
- Execute ``hello_world_performance.sh``
- Review the output

```bash
bash hello_world_performance.sh hello_world.sh hello_world.py

```

### Section II - Activities - Help

For each script you're going to need to:

- Pass the script an input parameter that is numerical
- Use the numerical input param to bound a loop construct
- Print to ``standard out`` ``Hello World!`` ``N`` times where ``N`` is passed as an input parameter
- Review the performance test and see which script took longer

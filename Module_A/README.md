# Introduction to Operating Systems (Part I)

## Preliminary Information
What is an [operating system](https://www.wikiwand.com/en/Operating_system)?


What is [Linux](https://www.linux.com/what-is-linux)?

[Why are we using Linux](https://opensourceforu.com/2017/03/reasons-to-use-linux/)?

---

## Section I - The Setup

We're going to be working within the Linux Distro CentOS through VirtualBox

Throughout this course we will provide the necessary supplemental information, 
but not screenshot by screenshot "how to install a program" type of guides.

- [What is VirtualBox?](https://www.wikiwand.com/en/VirtualBox)
- [Install VirtualBox](https://www.virtualbox.org/)
- Manually Install VirtualBox (Optional) 
- Download VirtualBox Course Image 
- Ensure you can login to CentOS VirtualBox 


### Section I - Manual Install Guide

Insert Video Here
    
### Section I - Image Install Guide

Insert Video Here
    
    
### Section I - Knowledge Mastery

- What is a hypervisor?
- What are the different types of hypervisors?
- **What is a virtual machine?**
- What is Unix?
- What is Linux?
- Who created Linux?


---

## Section II - Some Basics

#### [What is the Shell?](http://linuxcommand.org/lc3_lts0010.php)


Beware, there are several types of [Shells](https://www.thegeekdiary.com/unix-linux-what-is-a-shell-what-are-different-shells/)!


#### What Shell am I using in CentOS?

```bash
ls -l "$(which sh)"
```
![Alt text](./resources/ss_which_shell.png?raw=true)

---
#### Shell Resources

- [TLPD](https://www.tldp.org/LDP/Bash-Beginners-Guide/html/Bash-Beginners-Guide.html)
- [Google's Shell Style Guide](https://google.github.io/styleguide/shell.xml)
---
#### If you ever wanted to know anything about a Linux command:

**Example Syntax**
```bash
man {{put command here}}
```
**Example Usage**
```bash
man ls 
man cat
man mkdir
```

#### [Online Man Pages](http://man7.org/linux/man-pages/index.html)

#### [Linux Users, Groups and Permissions](https://www.stackchief.com/tutorials/Linux%20Users,%20Groups,%20and%20Permissions)

### Section II - Knowledge Mastery

- **What is a user?**
- What is a group?
- What are permissions?
- What is the Linux shell?
- How do I get more information about Linux commands?

---

## Section III - Activity I - Navigation

``
You've made it to your first activity, congratulations!
``


- Navigate to the folder <code>/tmp</code>
- Remove all the files within <code>/tmp</code>
- Create the folder <code>myFolder</code>
- Navigate into your newly created folder
- Create the file <code>name.txt</code>
- Write your full name into <code> name.txt </code>
- Navigate to the folder <code>/tmp</code>
- Create the folder <code>myFolderNew</code>
- Move <code>myFolder</code>into<code>myFolderNew</code>
- Install the package <code>tree</code> using <code>yum</code>
- Navigate to <code>/tmp</code>
- Run <code>pwd</code> 
- Run <code>tree</code>
- Run <code>cat /tmp/myFolderNew/myFolder/name.txt</code>

![Alt text](./resources/ss_activity_i.png?raw=true)

- Copy the autograder <code>activity_1_ag.sh</code> to <code>/tmp</code>
- Execute the autograder


![Alt text](./resources/ss_activity_i_ag.png?raw=true)

``
You've completed your first activity, congratulations!
``

#### Activity I Troubleshooting

- If you cannot ***execute*** the autograder, it's okay (maybe the script isn't ***executable*** hint hint)
- If you cannot ***install tree***, you should get a nice message that tells you the requirements

### Section III - Activity I - Knowledge Mastery

- What is a good online resource for Linux commands?
- How do I navigate the shell?
- How do I create a: file, directory?
- How do I copy files?
- How do I move files?
- How can I make a script executable?
- How can I execute a script?

---
# Advanced Configuration

## Section I - Introduction

We introduced the `configuration problem` in the last module, where we would
like to configure resources in groups rather than individually


## Section II - Introduction to Configuration Tools: Ansible, Puppet, Chef

`Ansible`, `Puppet` and `Chef` are all tools (there are many others) that 
provide a solution to the `configuration problem`


`Ansible` is an application written in `Python` that executes
remote commands on a target through `ssh` (push model)

`Puppet` is an application written in `Ruby` that consists of `server nodes` 
and `agent nodes` where `agents` will poll configuration changes/updates 
from `server nodes` (pull model)

`Chef` is an application written in `Ruby`, it's architecture is similar
to `Puppet` in that it can be used in a pull model fashion, however there exists
a plugin `knife` that performs operations in a manner similar to `Ansible's` push model


## Section III - Activity I  - Cluster Setup

You're going to user Docker to create a small `cluster` of "servers" 
(remember we're going to pretend like our `containers` are `servers` since 
it's cheaper)

`Cluster` or `stack` is terminology to denote multiple `servers` or `containers`

We're going to go through ane excerpt of script `setup_cluster.sh` in `/Module_F/setup_cluster`

```bash
#!/usr/bin/env bash

ssh-keygen -f ./clusterkey -t rsa -N ''

docker build -t cluster-server --build-arg ssh_pub_key="$(cat ./clusterkey.pub)"  --build-arg ssh_prv_key="$(cat ./clusterkey)" .

sleep 2

server_count=20

for i in $(seq 1 1 $server_count)
do
if [[ ${i} == 1 ]]; then
docker run -i -t -d --name cluster-master cluster-server
docker exec -it cluster-master netstat -anp
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' cluster-master
else
docker run -i -t -d --name cluster-server-${i} cluster-server
docker exec -it cluster-server-${i} netstat -anp
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' cluster-server-${i} >> ./manage_list.txt
fi
done
```

In the script above we are

- Generating a new SSH private key and public key named `clusterkey` with an empty passphrase
- Creating a docker image named `cluster-server` that takes in those newly generated keys
- Taking a quick 2 second nap
- Setting the amount of `containers` we want to set up
- On first iteration of the for loop, we're creating a `container` named `cluster-master`;
All other subsequent iterations we're creating `cluster-servers` to be managed by the `cluster-master`
- On each iteration we are also checking the `ip4 address` and the 
`bound ports`within the container

We can think of this architecture similar to the diagram below:

-- insert diagram --

Now that we've set up our cluster, let's pretend that our `containers` are `servers`

Generally a DevOps engineer would `SSH` into a `server` open a shell session
and begin working

Let's ssh into our `cluster-master`

```bash
ssh -o "StrictHostKeyChecking no" -i clusterkey root@$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' cluster-master)
```

Where you should now have entered the  "`master server`"

![Alt text](./resources/a1_ss.png?raw=true)



```bash
cp /opt/ansible/launchpad/host.txt /tmp
cp /opt/ansible/launchpad/clusterkey /tmp
cat /tmp/host.txt
```

Copy the `host.txt` and `clusterkey` file to `/tmp` and inspect 
 `host.txt` with `cat`

You should see a list of ip addresses, this is the `cluster` you're
going to manage!

## Section III - Activity II  - Linear Scripting For Stacks

(On the "`master-server`")

Let's linearly loop through our `stack's` ip addresses and `echo` them
```bash
for ip_address in $(cat /tmp/host.txt)
do
echo "$ip_address"
done
```

Now let's expand and linearly loop through our 'stack' checking
the running processes of each

```bash
for ip_address in $(cat /tmp/host.txt)
do
echo "$ip_address"
ssh -o "StrictHostKeyChecking no" -i clusterkey root@$ip_address 'ps -ef'
done
```

**Congratulations you've just executed shell commands across a `stack` via `ssh`!**

Building on our previous lessons you can image the possibilities:
 
You can `apk add wget` across you `stack` to install `wget` 

You can like we did previously list all of the running processes with `ps -ef`

You can `kill -9 1` to completely destroy your `stack` 

**Pro Tip** don't destroy things yet!


## Section III - Activity III - Linear Versus Multithreaded Scripting for Stacks

We're going to expand on the `ps -ef` linear example from the previous section

Execute the command below!

```bash
bash linear_ps_versus_threaded_ps.sh
```

**Example Output**

```
Executing Bash Script

real    0m2.107s
user    0m0.167s
sys     0m0.073s

Executing Python Script

real    0m0.900s
user    0m0.216s
sys     0m0.081s
```

For my trial run we can see that the `Python` script is about
a full second faster than the `Bash` script
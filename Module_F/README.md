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
it's the cheapest thing to do)

`Cluster` or `stack` is terminology to denote multiple `servers` or `containers`




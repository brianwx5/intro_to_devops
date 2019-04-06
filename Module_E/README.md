# Introduction to Configuration

## Introduction

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

The rest of this module is entirely hands on, let's get going!

---




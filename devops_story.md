## An Aside: What should DevOps mean to you?

#### Think about a traditional team of sys admins and software developers thirty years ago (this is a dramatization).

Software Developers: "Hey sys admins, we need a new environment."

System Admins: "Great, how much traffic are you expecting?"

Software Developers: "We're not sure, but we think our code can handle 100,000
simultaneous connections."

System Admins: "Cool, we'll add redundancy and load balancing across a few different servers"

System Admins: \*Purchases servers*

System Admins: \*Racks and stacks servers*

System Admins: \*Configure servers*

System Admins: \*Configure servers to work within corporate network*

System Admins: \*Test and debug configuration*

System Admins: \*Configure server for application deployment*

... A few weeks later ...

System Admins: "We've got your application up and running in..."

Software Developers: "We think we need to add a few new servers and more cores to our existing ones."

System Admins: \*Facepalm*

System Admins: "Next can we communicate requirements more ahead of time, thanks."

#### Under a DevOps model

Software Developer A in Team A: "It looks like we haven't turned on auto scaling in AWS, can we just spin up some new
application servers?"

Software Developer B in Team A: "How many?"

Software Developer A in Team A: "10"

... 15 minutes later ...

Software Developer B in Team A: "We really need to integrate Packer into our processes, but
our Ansible playbook to create servers in AWS, create the load balancers, and configure/deploy our application is still
working like a charm"

Software Developer A in Team A: "Yeah I'm glad we wrote that, but it needs a refactor
there's a few new features in the newer version of Ansible I want to explore"

Software Developer B in Team A: "I'm going to switch gears and fix that bug in our application."

Software Developer A in Team A: "Okay cool, I think there was a null pointer exception caused by line 542"

Software Developers "This infrastructure expansion would have been a whole thing thirty years ago"

Software Developers "Hahaha yeah, can you imagine?"
# gustav
A personal journey into creating a Docker orchestrator

## Project overview

### Goal
My goal would be to create a masterless cluster. I have this idea that democracy in computer systems is possible because 
unlike people, software will happily make a lot of decisions and communicate those decisions. And as long the rules of
making a decision are concise, it should work.

Thus I'm thinking of a container management where one node will make a suggestion, the whole cluster "votes" and if 
enough nodes (all?) agree, the plan is applied. Essentially the whole cluster agrees on a queue of which node spawns the
next container. This would allow quick startup of new containers in case new service is spawned, up-scaled or a node is 
lost.

One more idea would be to always pull the images on every node so that in case of a re-balance the startup would be fast.

### Plan of attack
This is the initial plan I have to tackle the orchestrator.
* Create a DinD container
* Spawn a sibling Node.js server container from the DinD container
* Create endpoints in the server to get the state of the node, control new service, see stats
* Create a service discovery to allow creation of a cluster
* Make Node.js services register themselves and create a cluster
* ...

### Origin of the Name
This project is named in honour of Gustav Ernesaks - one of the most respected and loved Estonian conductors.
[Wikipedia](https://en.wikipedia.org/wiki/Gustav_Ernesaks)

## Technical details

### Building the Docker image
* Run `./build.sh`

### Running
* Run `./run.sh`


## TODO
* Add an argument to `run.sh` to mount the host Docker socket - hardcore mode !!!
* During the build already pull the node container for faster startup
* Chicken or egg - which should be the foreground process? The manager service or the docker daemon? Actually both.
* Run Node.js module installation during build. Sort of the same thing as pulling required images. Intermediate container?
* Detect daemon host/IP - currently hardcoded to `172.17.0.2`
* Could support configuring stuff via environment variables (eg. ports etc.)

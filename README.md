****

# Pre-Requisites:

## Mac or Windows:
On Mac and Windows users, do easy install of **Docker Desktop for Mac or Windows**, Docker Compose is included as part of those desktop installs.

## Linux Systems:

1. ### Step 1 — Install Docker  
Instructions are at [https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04)

2. ### Step 2 — Install Docker Compose  
Instructions are at [https://docs.docker.com/compose/install/#install-compose](https://docs.docker.com/compose/install/#install-compose)

****

## HOW to use:

1. Clone or Download this repo to an empty **local** folder of your choosing.
2. From the terminal cd into the newly created folder

3. Launch a new database instance:
```BASH
./Start.sh
```
4. Stop the database instance (data will be persisted across complete machine restarts)
```BASH
./Stop.sh
```
5. Remove the datafile permanently (the database will be completely removed)
```BASH
./Remove.sh
```

# NOTE:
> Even if you remove the database, ... a re-run of ./Start.sh will reconstruct the database to it's initial state.

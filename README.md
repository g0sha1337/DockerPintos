# DockerPintos
The main reason to run PintOS in Docker is to avoid dependency conflicts

## How to run pintos into docker container with shared volume for patching pintos sources with your favourite IDE

I'm gonna use windows 11 with wsl ubuntu22:04. You can also do that on your distro.
#### STEP 1 - CLONE REPOSITORY

``` bash
git clone https://github.com/g0sha1337/DockerPintos.git
```

or download .zip and unarchive

#### STEP 2 - BUILD 

```
docker build -t pintosdist .
```
..dont forget point at the and of command:)

#### STEP 3 - CREATE SHARED VOLUME

```
docker volume create PintOSVolume
```

#### STEP 4 - RUN CONRAINER 

```
docker run --name pintos --mount type=volume,src=PintOSVolume,dst=/home -d pintosdist sleep 2147483647
```

#### STEP 5 - CHECK FOR RUNNING CONTAINERS 

```
docker ps
```

#### STEP 6 - GET INTO CONTAINER 


```
docker exec -it -u 0 <hash> bash
```

Congratulations! You have launched and are now in your docker container with a customized shell for pintos 


## HOW TO ACCESS CONTAINER'S DIRECTORIES

#### STEP 1 - CHECK LOCATION

```
docker volume inspect PintOSVolume
```

..and you will get smthing like this:

```
    {
        "CreatedAt": "2025-01-25T15:14:46+03:00",
        "Driver": "local",
        "Labels": null,
        "Mountpoint": "/var/lib/docker/volumes/PintOSVolume/_data",
        "Name": "PintOSVolume",
        "Options": null,
        "Scope": "local"
    }
```

#### STEP 2 - GIVE PERMISSIONS 

To allow programs running outside of the docker container to access reading and editing pintos sources, you must configure access rights 

```
sudo chmod 777 /var/lib/docker/volumes/PintOSVolume  -R
```
777 - gives all permissions. You can also give permissions that you need.

-R - Recursively sets permissions on all files and directories inside PintOSVolume


# RESULT 

You can access to  `/var/lib/docker/volumes/PintOSVolume` and open this directory in your favourite IDE (such us vscode) 



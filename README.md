# DockerPintos
The main reason to run PintOS in Docker is to avoid dependency conflicts

## How to run pintos into docker container with shared volume for patching pintos sources with your favourite IDE

I'm gonna use windows 11 with wsl ubuntu22:04. You can also do that on your distro.
#### STEP 1 - PULL UBUNTU IMAGE

``` bash
sudo docker pull ubuntu
```

#### STEP 2 - CREATE SHARED VOLUME

```
sudo docker volume create PintOSVolume
```

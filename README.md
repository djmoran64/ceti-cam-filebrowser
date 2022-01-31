# File browser for the CETICam
This is the project for installing and configuring a file browser for use with the CETICam and the CETICam UI.

The file browser we are using is from the `filebrowser` project at http://filebrowser.org and on GitHib at https://github.com/filebrowser/filebrowser

This image is extremely small, like 35MB which makes it great for use on the **Jetson Nano**.

 for the `CETICam Web App`. It should work on any dev or production environment including the **Jetson Nano**

## Prerequisites
* `git` - verify by typing `git --version` at the command line
* `docker` - verify by typing `docker --version` at the command line

If these are not installed or you have trouble using them, see these instructions. <span style="color:red">**-ADD LINK HERE-**</span>

## Setup
No setup is required

## Build
```
docker build -t dmoran64/ceti-cam-filebrowser:0.9.0 .
```
## Run
```
docker run -d -v /Users/dmoran/Development:/srv -p 8088:80 --name ceti-cam-fb dmoran64/ceti-cam-filebrowser:0.9.0
```
Change `/Users/dmoran/Development` to match the location of the host directory to be shared and change `8088` to the port you want to use from the host machine



Very little setup is required.  The [filebrowser/filebrowser](https://hub.docker.com/r/filebrowser/filebrowser) docker image assumes:
*  It will look for a config file named `.filebrowser.json` (yes, that first dot is important) in the image root `/` folder.  
*  On first run, it will create a database file `database.db` in the root folder
*  The root folder of the host filesystem to be served must be bind mounted to `/srv` in the docker container

*The docker file will put the config file in the proper place and the volume bind should specified on the `docker run` command*

Config parameters can be set in the `config.json` file.

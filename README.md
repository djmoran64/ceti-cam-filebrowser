# File browser for the CETICam
This is the project for installing and configuring a file browser for use with the CETICam and the CETICam UI.  The reason for a seperate docker file is to get `filebrowser` to not have a login and to remove all the settings that could allow modifying the files.

The file browser we are using is from the `filebrowser` project at http://filebrowser.org and on GitHib at https://github.com/filebrowser/filebrowser

This image is extremely small, like 35MB which makes it great for use on the **Jetson Nano**.

 for the `CETICam Web App`. It should work on any dev or production environment including the **Jetson Nano**

## Prerequisites
* `git` - verify by typing `git --version` at the command line
* `docker` - verify by typing `docker --version` at the command line

If these are not installed or you have trouble using them, see these instructions. <span style="color:red">**-ADD LINK HERE-**</span>

## Setup
Make sure you are in the correct location where you want to install this project.  It will create a folder named `ceti-cam-filebrowser`
 
The GitHub repository is located https://github.com/djmoran64/ceti-cam-filebrowser<br>
Use your favorite tool to clone the repository: `https://github.com/djmoran64/ceti-cam-filebrowser.git`
  ```
  git clone https://github.com/djmoran64/ceti-cam-filebrowser.git
  ```

## Build
```
docker build -t dmoran64/ceti-cam-filebrowser:0.9.0 .
```
## Run
```
docker run -d -v /Users/dmoran/Development:/srv:ro -p 8088:80 --name ceti-cam-fb dmoran64/ceti-cam-filebrowser:0.9.0
```
Change `/Users/dmoran/Development` to match the location of the host directory to be shared and change `8088` to the port you want to use from the host machine

## Details

The [filebrowser/filebrowser](https://hub.docker.com/r/filebrowser/filebrowser) docker image settings are as follows:
* The executable `filebrowser` is installed in the root `/` folder along with a default `.filebrowser.json` which has some system defaults.
* The docker file uses the `filebrowser` executable during build to:
  * Create and initialize the `database.db` in the root '/' folder
  * Allow anonymous access
  * Create a user who has only read permissions
*  The root folder of the host filesystem to be served is bind mounted to `/srv` in the docker container.  the `:ro` on the volume mount makes the host filesystem read only for added protection.
  
The documentation for `filebrowser` commands is at https://filebrowser.org/cli/filebrowser

*Getting the proper setup was a major PITA.  It seems to be better to run the config and user commands directly and not mess around with the config files.*
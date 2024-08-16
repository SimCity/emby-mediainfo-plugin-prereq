# Emby MediaInfo Plugin Pre-Requisite Applications Mod

Installs the appications required by the [MediaInfo Plugin](https://emby.media/community/index.php?/topic/108984-mediainfo-for-emby-pluginhdr-vision-atmos-dtsx/)

This is based off of [Docker-MediaInfo-PreReq](https://github.com/MrLinford/Docker-MediaInfo-PreReq/tree/main) by MrLinford.

It will perform all of the setting up of the applications the MediaInfo plugin uses to read and modify your media files as per the first step of the initial setup process.

> **Note**
> It will not set anything up in Emby, this is left to the user to setup.
> Everything is setup under /bin/

Follow [Cheesgeezer's wiki](https://github.com/Cheesegeezer/MediaInfoWiki/wiki) on how to use the plugin for details on how to do everything else.

Following will be installed:

* MediaInfoCLI
* mkvtoolnix Portable (refer to MediaInfo wiki for details regarding version installed)
* mkvtoolnix Portable GUI

Optional:
* BifTool Executables (also installs unzip to unpack)

If you wish to also use MediaInfo's BIF Generator, you will need to also add an environment variable to include BifTool so that this will be avaiable for use.

To include BifTool add an environment variable:
  INCLUDE_BIFTOOL=TRUE

The Following locations are required to be entered into MediaInfos settings in the relevant fields:
* /bin/mediainfo
* /bin/mkvpropedit
* /bin/biftool

If adding multiple mods, enter them in an array separated by `|`, such as `DOCKER_MODS=linuxserver/mods:openssh-server-rsync|linuxserver/mods:openssh-server-mod2`

Full example:

docker run
```bash
docker create \
  --name=emby \
  -e DOCKER_MODS=ghcr.io/simcity/emby-mediainfo-plugin-prereq:latest \
  -e INCLUDE_BIFTOOL=TRUE \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -p 8096:8096 \
  -v <path to data>:/config \
  -v <path/to/media>:/media \
  --restart unless-stopped \
  linuxserver/emby
```
 docker compose
```yaml
---
services:
  emby:
    image: linuxserver/emby:latest
    container_name: emby
    environment:
      - DOCKER_MODS=ghcr.io/simcity/emby-mediainfo-plugin-prereq:latest
      - INCLUDE_BIFTOOL=TRUE #optional
      - PUID=1000
      - PGID=1000
      - TZ=Europe/London
    volumes:
      - /path/to/data:/config
      - /path/to/media:/media #optional
    ports:
      - 8096:8096
    restart: unless-stopped
```


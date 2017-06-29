![Medusa](static/images/medusa-logo.png)

[![Build Status](https://drone.xataz.net/api/badges/xataz/docker-medusa/status.svg)](https://drone.xataz.net/xataz/docker-medusa)
[![](https://images.microbadger.com/badges/image/xataz/medusa.svg)](https://microbadger.com/images/xataz/medusa "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/xataz/medusa.svg)](https://microbadger.com/images/xataz/medusa "Get your own version badge on microbadger.com")

> This image is build and push with [drone.io](https://github.com/drone/drone), a circle-ci like self-hosted.
> If you don't trust, you can build yourself.

## Tag available
* latest [(Dockerfile)](https://github.com/xataz/dockerfiles/tree/master/medusa/Dockerfile)

## Description
What is [Medusa](https://github.com/pymedusa/Medusa/) ?

### Automatic Video Library Manager for TV Shows. It watches for new episodes of your favorite shows, and when they are posted it does its magic.

#### Exclusive features
 - Supports TVMaze and TMDB indexers
 - Manual search episodes (you choose what to snatch based on all kind of info: provider, seeds, release group)
 - Manual search for subtitles (useful when subtitle has low score because of typo in filename or alternative title)
 - Uses 'guessit' library to parse and enrich existing info (more precise than regexes)
 - Improved Anime shows support
 - Faster DailySearcher|Backlog|Find propers as we only process new items. Already processed items are discarded.
 - Option to clean Kodi library when replacing existing files
 - Better quality explanations and consistent quality code in all threads
 - See on the fly if your backlogged episodes will be increased/reduced while changing qualities
 - Postpone Post Processing until Medusa downloads wanted subtitle (useful to only show media if subtitle available)
 - Clean up any leftover files/folders if media file is deleted
 - Nightly showupdater updates only the season of the show, which has been updated by the indexer, for tvdb and tmdb.

 #### Features
 - Kodi/XBMC library updates, poster/banner/fanart downloads, and NFO/TBN generation
 - Sync your shows with Trakt. Keep shows/episode updated in Trakt watchlist
 - Configurable automatic episode renaming, sorting, and other processing
 - Easily see what episodes you're missing, are airing soon, and more
 - Automatic torrent/nzb searching, downloading, and processing at the qualities you want
 - Largest list of supported torrent and nzb providers, both public and private
 - Can notify Kodi, XBMC, Growl, Trakt, Twitter, and more when new episodes are available
 - Searches TheTVDB.com and AniDB.net for shows, seasons, episodes, and metadata
 - Episode status management allows for mass failing seasons/episodes to force retrying
 - DVD Order numbering for returning the results in DVD order instead of Air-By-Date order
 - Allows you to choose which indexer to have Medusa search its show info from when importing
 - Automatic XEM Scene Numbering/Naming for seasons/episodes
 - Available for any platform, uses a simple HTTP interface
 - Specials and multi-episode torrent/nzb support
 - Automatic subtitles matching and downloading
 - Improved failed download handling
 - DupeKey/DupeScore for NZBGet 12+
 - Real SSL certificate validation

#### Screenshots
- [Desktop (Full-HD)](http://imgur.com/a/4fpBk)
- [Mobile](http://imgur.com/a/WPyG6)

**This image not contains root process**

## Build Image

```shell
docker build -t xataz/medusa github.com/xataz/dockerfiles.git#master:medusa
```

## Configuration
### Environments
* MEDUSA_WEBROOT : Choose webroot of medusa (default : "/")
* MEDUSA_ENCRYPTION_VERSION : Encrypt password method on config.ini (default : 0)
* MEDUSA_TVDIRS : Folder where find TV Shows (default : /data/Media/TV)
* UID : Choose uid for launch medusa (default : 991)
* GID : Choose gid for launch medusa (default : 991)

### Volumes
* /config/Medusa : Path where is configuration of medusa

### Ports
* 8080 

## Usage
### Speed launch
```shell
docker run -d -p 8080:8080 xataz/medusa
```
URI access : http://XX.XX.XX.XX:8080

### Advanced launch
```shell
docker run -d -p 9000:8080 \
	-e MEDUSA_WEBROOT=/medusa \
	-e MEDUSA_ENCRYPTION_VERSION=2 \
	-e MEDUSA_TVDIRS=/TV \
	-e UID=1001 \
	-e GID=1001 \
	-v /docker/config/medusa:/config/Medusa \
	xataz/medusa
```
URI access : http://XX.XX.XX.XX:9000/medusa

## Contributing
Any contributions, are very welcome !
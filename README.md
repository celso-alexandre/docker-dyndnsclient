# A docker container made to act as a Dyndns Client updater, powered Inadyn. Made for a simple deploy

## Environment variables for quick start
* `USERNAME`
* `PASSWORD`
* `SYSTEM` defaults to `default@dyndns.org`

## Downloading and building
```
mkdir -p /data/docker/builds
cd /data/docker/builds
git clone https://github.com/celso-alexandre/docker-dyndnsclient.git
cd docker-dyndnsclient
docker build -t dyndnsclient .
```

## Volumes for quick start
* `/etc/localtime:/etc/localtime:ro` - Sets the timezone to match the host
* `/data/docker/containers/dyndnsclient/config:/config` - Stores the inadyn.conf file.

# Example with docker run
```
docker run -e USERNAME user \
           -e PASSWORD pass \
           -e SYSTEM default@dyndns.org \
           -v /etc/localtime:/etc/localtime:ro \
           -v /home/rose/docker/ddns/config/:/config \
           dyndnsclient
```

# Example with docker compose
```
version: '2'
services:
  dyndnsclient:
    image: dyndnsclient
    container_name: dyndnsclient
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - /home/rose/docker/ddns/config/:/config    
    environment:
      - USERNAME=user
      - PASSWORD=pass
      - SYSTEM=default@dyndns.org
    restart: always
```
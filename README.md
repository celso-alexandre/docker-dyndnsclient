# A docker container made to act as a Dyndns Client updater, powered Inadyn. Made for a simple deploy

## Environment variables for quick start
* All variables will be ignored if you already have your `inadyn.conf` configuration file in place. The init script won't ever replace/override your `inadyn.conf`.
* `USERNAME`
* `PASSWORD`
* `SYSTEM` defaults to `default@dyndns.org`
* `ALIAS` should be your DynDNS Hostname (`testdomain.info`, for example)

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
sudo docker run -t -i \
           -e "USERNAME=user" \
           -e="PASSWORD=pass" \
           -e "SYSTEM=default@dyndns.org" \
           -e "ALIAS=testdomain.info" \
           -v /etc/localtime:/etc/localtime:ro \
           -v /data/docker/containers/dyndnsclient/config:/config \
           --restart always
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
      - /data/docker/containers/dyndnsclient/config:/config    
    environment:
      - USERNAME=user
      - PASSWORD=pass
      - SYSTEM=default@dyndns.org
      - ALIAS=testdomain.info
    restart: always
```
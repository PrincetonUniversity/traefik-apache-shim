# Traefik Apache Shim
This is a simple set of demo containers for starting up an Apache 2.4 container to handle SSO login and pass that through to a back end flask application.  This is setup to use CAS via `mod_auth_cas` but the same basic principal should apply for other authentication mechanisms as well.

## Assumptions
* A pre-existing traefik install is configured on the machine.
* The value of `SERVICENAME` has to be configured as a host in `/etc/hosts`, we suggest just setting `SERVICENAME` to `self.local` and adding `self.local 127.0.0.1` to your hosts file.
* A pre-existing network has been created in docker named `proxy`; only containers exposing connections to this network will be available via traefik.


## Basic Architecture

```
External      +-----------------+          +-------------+          +------------+
Ports         | Traefik         |          | Apache Rev. | docker   | Flask demo |
  http: 80 +--+ Service         | proxy    | Proxy       | default  | app echoing|
              |                 +----------> w/ mod auth +--------->+ cas        |
  https:443+--+                 | network  | cas         | network  | REMOTE_USER|
              |                 | port 80  |             | port     |            |
              +-----------------+          +-------------+ 5000     +------------+
```

## What this looks like from your applications standpoint
Inside an individual application the request header `HTTP_X_REMOTE_USER` will be set to the username of the individual that logged in in cas. From there decisions can be made based on defined roles and permissions as to what you give the individual access to.  For example flask app-builder supports remote_user authentication out of the box and can be used with this approach.

## Never setup Traefik before?
The sub folder `traefik-example` includes a docker-compose and basic config file to get you started with v2.1, this setup will use self-signed certs but is functional enough for a demo.

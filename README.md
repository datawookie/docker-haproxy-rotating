# HAProxy-Rotating

The objective with this project is to build a Docker image which will provide a rotating [forward proxy](https://en.wikipedia.org/wiki/Proxy_server).

## What is HAProxy?

[HAProxy](http://www.haproxy.org/) is a reliable, high-performance TCP/HTTP load balancer.

Reference documentation:

- [HAProxy Starter Guide](https://cbonte.github.io/haproxy-dconv/2.0/intro.html)
- [HAProxy Configuration Manual](https://cbonte.github.io/haproxy-dconv/2.0/configuration.html) and
- [HAProxy Management Guide](https://cbonte.github.io/haproxy-dconv/2.0/management.html).

## HAProxy Configuration

The behaviour of HAProxy is determined by its configuration file, `haproxy.cfg`. Sample configurations can be found [here](http://git.haproxy.org/?p=haproxy-2.0.git;a=tree;f=examples).

This is a simple `haproxy.cfg` file:

```
global
        maxconn 256
        log stdout local0 debug
 
defaults
        mode http
        log global
        option httplog
        timeout connect 5000ms
        timeout client 50000ms
        timeout server 50000ms
 
frontend rotating-proxies
        bind *:3128
        option http_proxy
        default_backend proxies
 
backend proxies
        server proxy-1  15.244.85.32:8888 check
        server proxy-2   16.42.5.170:8888 check
        server proxy-3  33.179.179.1:8888 check
        server proxy-4  3.87.204.123:8888 check
        balance random
```

### Section: `global`

The `daemon` directive will cause HAProxy to run as a background process.

### Section: `defaults`

### Section: `frontend`

### Section: `backend`

The `balance` directive determines how requests are allocated to servers. There are a number of options including:

- `roundrobin` (each server used in turn)
- `leastconn` (favours server with least connections) and
- `random` (server assigned at random).

## Building the Image

This image is based on the [official Docker Community image](https://hub.docker.com/_/haproxy). The specification of the base image can be found [here](https://hub.docker.com/_/haproxy).

You can build the image manually:

```bash
docker build -t datawookie/haproxy-rotating .
```

Alternatively you can use the `build` target in the `Makefile`.

```bash
make build
```

## Running the Image

docker run -p 3128:3128 datawookie/haproxy-rotating
docker run -p 3128:3128 -v $PWD:/usr/local/etc/haproxy:ro datawookie/haproxy-rotating

The `Makefile` also has a `run` target.

```bash
make run
```

## Related Projects

- https://github.com/mattes/rotating-proxy
- https://github.com/39ff/docker-rotating-proxy
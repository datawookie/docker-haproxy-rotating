https://www.digitalocean.com/community/tutorials/how-to-use-haproxy-to-set-up-http-load-balancing-on-an-ubuntu-vps

http://blog.databigbang.com/running-your-own-anonymous-rotating-proxies/

https://stackoverflow.com/questions/56471379/why-always-receive-status-code-400-when-sending-http-request-to-haproxy

https://hub.docker.com/_/haproxy

https://github.com/mattes/rotating-proxy
https://github.com/39ff/docker-rotating-proxy

Manuals

https://cbonte.github.io/haproxy-dconv/2.1/configuration.html
https://cbonte.github.io/haproxy-dconv/2.1/intro.html
https://cbonte.github.io/haproxy-dconv/2.1/management.html

Config Examples

http://git.haproxy.org/?p=haproxy-1.8.git;a=tree;f=examples
http://git.haproxy.org/?p=haproxy-1.8.git;a=blob_plain;f=examples/transparent_proxy.cfg;hb=HEAD



# roundrobin - Each server is used in turns, according to their weights.
# leastconn  - The server with the lowest number of connections receives the connection.
# random

docker run --rm --name haproxy-rotating -p 3128:3128 datawookie/haproxy-rotating
docker run --rm --name haproxy-rotating -p 3128:3128 -v $PWD:/usr/local/etc/haproxy:ro datawookie/haproxy-rotating
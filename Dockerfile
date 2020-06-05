#
# $ curl --proxy 127.0.0.1:3128 http://httpbin.org/ip
#
# Baked-in Configuration
# ======================
#
# Build:
#
# $ docker build -t rotating-proxy .
#
# Evaluate configuration:
#
# $ docker run -it --rm rotating-proxy haproxy -c -f /usr/local/etc/haproxy/haproxy.cfg
#
# Mounted Configuration
# =====================
#
# Debugging
# =========
#
# $ haproxy -d -f ./haproxy.cfg
#
# Notes on Configuration File
# ===========================
#
# - https://www.haproxy.com/blog/the-four-essential-sections-of-an-haproxy-configuration/
#
FROM haproxy:2.0
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
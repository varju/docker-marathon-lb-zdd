marathon-lb-zdd
===============

Application wrapper to execute marathon-lb's zdd.py script for zero-downtime
deployments.  See https://github.com/mesosphere/marathon-lb for more
information.


Usage
-----

From the directory containing your JSON service definition:

```
docker run --rm -ti --volume `pwd`:/data varju/marathon-lb-zdd \
  --syslog-socket /dev/null \
  --force \
  --marathon http://my.marathon.master:8080 \
  --marathon-lb http://my.marathon.lb:9090 \
  --json service-definition.json
```

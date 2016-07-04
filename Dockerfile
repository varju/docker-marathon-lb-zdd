FROM python:3.5-alpine

RUN apk add --no-cache git

ENV MARATHON_VERSION v1.3.0

COPY resolve-ec2-ips.patch /tmp
RUN cd /usr/src \
    && git clone https://github.com/mesosphere/marathon-lb.git \
    && cd marathon-lb \
    && git reset --hard $MARATHON_VERSION \
    && patch < /tmp/resolve-ec2-ips.patch \
    && pip install --no-cache-dir -r requirements.txt

VOLUME /data
WORKDIR /data

ENTRYPOINT ["python3", "/usr/src/marathon-lb/zdd.py"]
CMD []

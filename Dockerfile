FROM python:3.5-alpine

RUN apk add --no-cache git

RUN cd /usr/src \
    && git clone https://github.com/mesosphere/marathon-lb.git \
    && cd marathon-lb \
    && pip install --no-cache-dir -r requirements.txt

VOLUME /data
WORKDIR /data

ENTRYPOINT ["python3", "/usr/src/marathon-lb/zdd.py"]
CMD []

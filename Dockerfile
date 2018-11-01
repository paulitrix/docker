FROM ubuntu:16.04
MAINTAINER Rafal Leszko
RUN apt-get update && \
apt-get install -y python
COPY hello.py .
VOLUME /host_directory
ENTRYPOINT ["python","hello.py"]

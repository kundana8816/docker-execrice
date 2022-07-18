FROM ubuntu:latest
RUN apt-get -y update
RUN mkdir -p /scripts
COPY ./test.sh /scripts
WORKDIR /scripts
RUN chmod +x test.sh
RUN ./test.sh
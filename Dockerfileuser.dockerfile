FROM UBUNTU:LATEST
RUN apt-get -y update
RUN groupadd -r user1 && useradd -r -g user1 user1 user1
USER user1
ARG evn=MY_NAME
# Container to run on QNAP hardware to sync with rclone
#
# Mount file to be backed up into the container at /backup-source
# before starting it. Set rclone environment vars as documented at
# https://rclone.org/docs/#environment-variables

FROM debian:latest

MAINTAINER <Joel>
LABEL description="Container for running rclone (https://rclone.org/) on a QNAP device."

RUN apt update && apt upgrade -y && apt clean
RUN apt update && apt install -y wget unzip && apt clean
RUN wget -O /tmp/rclone.zip https://downloads.rclone.org/v1.64.2/rclone-v1.64.2-linux-amd64.zip && \
    unzip -j /tmp/rclone.zip -d /usr/local/rclone && \
    rm /tmp/rclone.zip && \
    ln -s /usr/local/rclone/rclone /usr/local/bin/rclone

ADD start.sh /usr/local/bin/

ENV LANG en_US.UTF-8

CMD /usr/local/bin/start.sh

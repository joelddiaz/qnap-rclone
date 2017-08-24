# Container to run on QNAP hardware to sync with rclone
#
# Mount file to be backed up into the container at /backup-source
# before starting it. Set rclone environment vars as documented at
# https://rclone.org/docs/#environment-variables

FROM debian:latest

MAINTAINER <Joel>
LABEL description="Container for running rclone (https://rclone.org/) on a QNAP device."

RUN apt-get update && apt-get upgrade -y && apt-get clean
RUN apt-get update && apt-get install -y wget unzip && apt-get clean
RUN wget -O /tmp/rclone.zip https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
    unzip -j /tmp/rclone.zip -d /usr/local/rclone && \
    rm /tmp/rclone.zip && \
    ln -s /usr/local/rclone/rclone /usr/local/bin/rclone

ADD start.sh /usr/local/bin/

ENV LANG en_US.UTF-8

CMD /usr/local/bin/start.sh

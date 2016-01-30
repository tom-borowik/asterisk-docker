############################################################
# Dockerfile to convert IVR prompts with freeswitch
# Based on Debian Jessie
############################################################

FROM debian:jessie

RUN apt-get update
RUN apt-get -y install asterisk
ADD http://asterisk.hosting.lv/bin/codec_g729-ast130-gcc4-glibc-x86_64-core2.so /usr/lib/asterisk/modules
RUN /etc/init.d/freeswitch start

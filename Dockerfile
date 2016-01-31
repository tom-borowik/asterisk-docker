############################################################
# Dockerfile to convert IVR prompts with freeswitch
# Based on Debian Jessie
############################################################

FROM debian:jessie
RUN apt-get update
RUN apt-get -y install asterisk

# Loading g729 codec:
##	If this codec doesn't load check Asterisk version installed by apt-get
##	Check if it's loaded with core show translation
## 	Also make sure you have the right codec for host architecture
## 	Avail here: http://asterisk.hosting.lv/#bin
ADD http://asterisk.hosting.lv/bin/codec_g729-ast110-gcc4-glibc-x86_64-core2.so /usr/lib/asterisk/modules/codec_g729.so

RUN chmod 644 /usr/lib/asterisk/modules/codec_g729.so
ADD do_convert.sh /do_convert.sh
RUN mkdir /home/gsm
CMD ["/do_convert.sh", "/home/in/", "/home/gsm/", "/home/out/"]
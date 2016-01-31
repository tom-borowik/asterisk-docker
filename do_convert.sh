#!/bin/bash

# Original Author: Nathan Sullivan
# https://github.com/CpuID

#starting asterisk
/etc/init.d/asterisk start
sleep 1

# specify 3 parameters - input_dir gsm_dir output_dir
# you need to make the params full paths, ie. /root/credit_card_recharge/
for i in `find $1 -type f`; do sox $i -r 8000 -c 1 $2/`basename $i | sed -e 's/.wav/.gsm/'` gain -n -1.5; done

chmod 644 $2/*

# Do conversion from GSM to ULAW/ALAW/G729
for j in `find $2 -type f`; do asterisk -rx "file convert $j $3`basename $j | sed -s 's/.gsm/.ulaw/'`"; done
for k in `find $2 -type f`; do asterisk -rx "file convert $k $3`basename $k | sed -s 's/.gsm/.alaw/'`"; done
for l in `find $2 -type f`; do asterisk -rx "file convert $l $3`basename $l | sed -s 's/.gsm/.g729/'`"; done
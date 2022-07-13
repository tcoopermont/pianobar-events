#!/bin/bash -x

echo first $1 $2

config_path=/home/debian/.config/pianobar
arecord -vv -f cd -D looprec -r 48000 test3.wav > /dev/null 2>&1  &
pid=$!
echo $pid > $config_path/record_pid
echo dummy.wav >$config_path/last_title
pianobar
sleep 1

kill -s SIGINT $pid

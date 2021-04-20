#!/bin/sh

cd thirdparty/mjpg-streamer/mjpg-streamer-experimental

export LD_LIBRARY_PATH="$(pwd)"

./mjpg_streamer -i "./input_uvc.so -r 1600x1200" -o "./output_http.so -w ./www -l 192.168.0.19 -p 8081"

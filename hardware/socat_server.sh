#!/bin/bash

socat /dev/ttyUSB0,raw,echo=0,b115200 tcp-listen:8888,reuseaddr

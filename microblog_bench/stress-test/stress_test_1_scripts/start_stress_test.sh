#!/bin/bash

stress-ng --matrix 0 -t 1h

rm -f pid
echo "$!" >> pid
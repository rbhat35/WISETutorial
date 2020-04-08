#!/bin/bash

rm -f pid 
stress-ng --matrix 0 -t 1h

# This saves the PID for use in stop_stress_test
# Note that, in my testing, this doesn't work, so it can be removed.
echo "$!" >> pid
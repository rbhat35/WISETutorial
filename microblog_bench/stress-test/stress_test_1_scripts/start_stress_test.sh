#!/bin/bash
rm -f pid 

##################################
     # DO NOT EDIT ABOVE THIS #
##################################

# DO NOT assume any packages are installed, other than stress-ng
stress-ng --matrix 0 -t 1h

##################################
     # DO NOT EDIT BELOW THIS #
##################################

# This saves the PID for use in stop_stress_test
echo "$!" >> pid
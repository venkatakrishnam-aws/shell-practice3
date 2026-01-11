#!/bin/bash

NUMBER1=100
NUMBER2=200
NUMBER3=$((NUMBER1+NUMBER2))

Timestamp=$(date +%Y-%m-%d\ %H:%M:%S)
echo "Sum of $NUMBER1 and $NUMBER2 is: $NUMBER3 at $Timestamp"

# End of script
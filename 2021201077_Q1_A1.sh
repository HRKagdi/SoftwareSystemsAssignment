#!/bin/bash

ls -d */
du -sh -- */ | sort -rh | sed 's/.$//'|  awk '{print $2"\t"$1}'

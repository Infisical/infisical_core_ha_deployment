{% raw %}#!/bin/bash
      if [ -z "$1" ]; then
          echo "Usage: $0 <seed>"
          exit 1
      fi
      seed="$1"
      length=128
      result=""
      while [ ${#result} -lt $length ]; do
          seed=$(echo -n "$seed" | sha512sum | awk '{print $1}')
          result+=$seed
      done
      echo ${result:0:$length}{% endraw %}
#!/bin/bash

INDEX=0

function checkFeed {
  echo "Reading index " $1
  #swarm-cli feed print \
  output=$(node swarm-cli/dist/src/index.js feed print \
    --address 0x9687528e087e529906d2fdc219a8e1a678ec3af3 \
    --topic-string "Sharded Sepolia Test - 46" \
    --stamp 80adb4be9e982cf25e8b8608787905d3351c7ab708484f07ddd8f8c7a6695cee  \
    --index $1 \
    | tee /dev/tty)

  echo $output

  if echo "$output" | grep -q "Topic:"; then
    return 1
  else
    return 0
  fi
}

while true; do
  checkFeed $INDEX
  result=$?

  if [ $result -eq 1 ]; then
    INDEX=$((INDEX+1))
  fi
done

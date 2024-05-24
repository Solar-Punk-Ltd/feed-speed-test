#!/bin/bash

INDEX=0

function checkFeed {
  echo "Reading index " $1
  #swarm-cli feed print \
  output=$(node swarm-cli/dist/src/index.js feed print \
    --address ADDRESS_PLACEHOLDER \
    --topic-string "topic for testing" \
    --stamp STAMP_PLACEHOLDER  \
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

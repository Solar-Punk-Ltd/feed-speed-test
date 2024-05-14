#!/bin/bash

INTERVAL=10
INDEX=0

function writeFeed {
  swarm-cli feed update  \
    --topic-string "Second Test" \
    --reference 18846be0a6421a8cc71c0959a7a44804fcf1a67afaeada240f2d2c8640aa2df8 \
    --identity main \
    --stamp f80adf71f034bbba822341276b67ca50f9d8635ab6229b3f9e3ce8178bfe8edc
}

while true; do
  writeFeed
  INDEX=$((INDEX+1))
  echo "Index: " $INDEX
  sleep $INTERVAL
done

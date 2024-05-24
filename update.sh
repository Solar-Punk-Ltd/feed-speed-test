#!/bin/bash

INTERVAL=10
INDEX=0

REFERENCES=(
  "b5523b31077b9a130eb90baa724c2cf8250c169456b20193d208da7e7b654f86"
  "94ca72e40009c12db86954bbc576499ac0a23ad20e3d616dbe8168035714a87d"
  "bc19ab17ad1586ffe95a91ffdbde75d7fc223c965aad035d93965fef33c6953c"
  "49880a2c83304ea6bea37a67902f7161c0b030793ebbebb8871aee6b6d590277"
  "95e977dc4788f04d11a3ed0195633006afae872ca4f919a4148b4a0879069359"
  "99b9ff38581128a68f82f4ba136d6dddfa61ba1803c988fd112755242028d20d"
  "a3bbdecbb2f05e68316cf51a2cb51263ca9792cfda70ea5c75ba6190cdda4756"
)

function writeFeed {
  local reference=${REFERENCES[$INDEX]}

  echo "Writing to index " $1
  #swarm-cli feed update  \
  node swarm-cli/dist/src/index.js feed update \
    --topic-string "topic for testing" \
    --reference $reference \
    --identity main \
    --stamp STAMP_PLACEHOLDER \
    --index $1
}

while true; do
  writeFeed $INDEX
  INDEX=$((INDEX+1))
  sleep $INTERVAL
done

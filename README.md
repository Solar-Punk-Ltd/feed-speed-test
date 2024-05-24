# Feed speed test

## Install

1) swarm-cli needs to be installed by running `npm install` and `npm run build` in swarm-cli
2) an identity that is named `main` needs to exist (or change name in update.sh)
3) a valid stamp needs to be added in both `update.sh` and `check.sh` (STAMP_PLACEHOLDER)
4) address for the identity needs to be added in `check.sh` (ADDRESS_PLACEHOLDER) (`swarm-cli identity list`)

## Use

1) `--topic-string` needs to be the same on both sides.
2) run `./update` in one terminal
3) run `./check` in another terminal

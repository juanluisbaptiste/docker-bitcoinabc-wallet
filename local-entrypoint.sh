#!/bin/bash
set -x
env > .envrc
. .envrc

export CMD="/home/user/bitcoin-abc/bin/bitcoin-qt"
. /entrypoint.sh

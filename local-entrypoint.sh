#!/bin/bash
env > .envrc
echo CMD="/home/user/bitcoin-abc/bin/bitcoin-qt" >> .envrc

. /entrypoint.sh

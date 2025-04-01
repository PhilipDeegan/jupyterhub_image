#!/usr/bin/env bash
set -ex
CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
(( $EUID == 0 )) && SUDO='' || SUDO='sudo'
(
  cd $CWD && $SUDO apt-get update
  $SUDO apt-get install -y gcc curl git python3-dev
  chmod +x run.sh && ./run.sh
)

#!/usr/bin/env bash
set -ex
CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
(( $EUID == 0 )) && SUDO='' || SUDO='sudo'
(
  cd $CWD
  $SUDO dnf install -y gcc curl python3-devel git
  chmod +x run.sh && ./run.sh
)

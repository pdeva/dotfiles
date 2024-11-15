#!/bin/bash

RUNDIR="/run/user/$(id -u)"
SYMLINK="${RUNDIR}/ssh_auth.sock"

ARG="$1"

# if no argument is passed, just print the help
if [ "${ARG}" == "" ]; then
  echo "usage: zellij-env.sh [update|shell]"
  exit 0
fi

if [ "${ARG}" == "update" ]; then
  echo "updating link"
  ln -sf "${SSH_AUTH_SOCK}" "${SYMLINK}"
  echo "current link: ${SYMLINK}"
  echo "current SSH_AUTH_SOCK: ${SSH_AUTH_SOCK}"
  exec zellij a
fi

if [ "${ARG}" == "shell" ]; then

  echo "creating link"
  rm -f "${SYMLINK}"
  ln -s "${SSH_AUTH_SOCK}" "${SYMLINK}"
  echo "exporting env var"
  export SSH_AUTH_SOCK="${SYMLINK}"
  exec zellij
fi

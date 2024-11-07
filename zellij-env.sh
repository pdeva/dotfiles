#!/bin/bash

RUNDIR="/run/user/$(id -u)"
SYMLINK="${RUNDIR}/ssh_auth.sock"


if [ -z "${ZELLIJ}" ]; then
  if [ ! -S "${SYMLINK}" ]; then
              echo "creating link"
              rm -f "${SYMLINK}"
              ln -s "${SSH_AUTH_SOCK}" "${SYMLINK}"
              echo "exporting env var"
              export SSH_AUTH_SOCK="${SYMLINK}"
              exec zellij
  else
    echo "updating link"
    ln -sf "${SSH_AUTH_SOCK}" "${SYMLINK}"
  fi
fi

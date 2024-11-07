#!/bin/bash

RUNDIR="/run/user/$(id -u)"
SYMLINK="${RUNDIR}/ssh_auth.sock"

# Check if not already in a Zellij session, terminal is not 'dumb',
echo "doing initial check"
if [ -z "${ZELLIJ}" ] && [ "${TERM}" != "dumb" ] && command -v zellij >/dev/null 2>&1; then
    echo "initial checks passed"
    # Set up SSH agent socket symlink if necessary
    if [ -n "${SSH_AUTH_SOCK}" ] && [ -S "${SSH_AUTH_SOCK}" ] && [ -w "${RUNDIR}/" ]; then
        if [ ! -S "${SYMLINK}" ]; then
            echo "creating link"
            rm -f "${SYMLINK}"
            ln -s "${SSH_AUTH_SOCK}" "${SYMLINK}"
        fi
    fi
fi

echo "checking link"
# Update SSH_AUTH_SOCK if the symlink exists
if [ -S "${SYMLINK}" ]; then
    echo "exporting env var"
    export SSH_AUTH_SOCK="${SYMLINK}"
fi

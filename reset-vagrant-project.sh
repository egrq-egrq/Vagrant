#!/usr/bin/env bash
set -euo pipefail

# Colors
GREEN="\033[0;32m"
RED="\033[0;31m"
NC="\033[0m"

info() {
  echo -e "${GREEN}[INFO]${NC} $*"
}

error() {
  echo -e "${RED}[ERROR]${NC} $*"
}

if [[ ${VAGRANT_CWD+x} || ${VAGRANT_VAGRANTFILE+x} || ${VAGRANT_DOTFILE_PATH+x} ]]; then
  error "Unset VAGRANT_CWD, VAGRANT_VAGRANTFILE and VAGRANT_DOTFILE_PATH before resetting this project."
  exit 1
fi

PROJECT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
cd -- "$PROJECT_DIR"
info "Working directory: $PROJECT_DIR"

if [[ ! -f Vagrantfile ]]; then
  error "No Vagrantfile beside this script. Aborting."
  exit 1
fi

info "Destroying all Vagrant VMs in this project"
if ! vagrant destroy -f; then
  error "vagrant destroy failed. Local .vagrant state was preserved."
  exit 1
fi

if [[ -d .vagrant ]]; then
  info "Removing local .vagrant directory"
  rm -rf -- "$PROJECT_DIR/.vagrant"
else
  info ".vagrant directory not found, nothing to remove."
fi

info "Vagrant project reset done."

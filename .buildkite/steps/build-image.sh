#!/bin/bash

set -euo pipefail

IMAGETAG=${BUILDKITE_BRANCH:-master}
BRANCHNAME=${BUILDKITE_BRANCH:-master}
COMPILETYPE=RelWithDebInfo

if [[ "${IMAGETAG}" == "master" ]]; then
    BUILDTYPE="stable"
    COMPILETYPE=Release
elif [[ "${IMAGETAG}" == "alfa" ]]; then
    BUILDTYPE="alfa"
else
    BUILDTYPE="latest"
fi

cd Docker
docker build -t cyberway/cyberway-notifier:${IMAGETAG} --build-arg=branch=${BRANCHNAME} --build-arg buildtype=${BUILDTYPE} --build-arg compiletype=${COMPILETYPE} .

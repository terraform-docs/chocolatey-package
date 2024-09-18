#!/usr/bin/env bash
#
# Copyright 2021 The terraform-docs Authors.
#
# Licensed under the MIT license (the "License"); you may not
# use this file except in compliance with the License.
#
# You may obtain a copy of the License at the LICENSE file in
# the root directory of this source tree.

set -o errexit
set -o pipefail

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

if [ -z "${CURRENT_BRANCH}" ] || [ "${CURRENT_BRANCH}" != "main" ]; then
    echo "Error: The current branch is '${CURRENT_BRANCH}', switch to 'main' to do the release."
    exit 1
fi

if [ -n "$(git status --short)" ]; then
    echo "Error: There are untracked/modified changes, commit or discard them before the release."
    exit 1
fi

CURRENT_VERSION=${1//v/}
RELEASE_VERSION=${2//v/}
RELEASE_CHECKSUM=$3

if [ -z "${CURRENT_VERSION}" ]; then
    echo "Error: current version is missing"
    exit 1
fi
if [ -z "${RELEASE_VERSION}" ]; then
    echo "Error: release version is missing"
    exit 1
fi

if [ -z "${RELEASE_CHECKSUM}" ]; then
    RELEASE_CHECKSUM=$(curl -sSL https://terraform-docs.io/dl/v${RELEASE_VERSION}/terraform-docs-v${RELEASE_VERSION}.sha256sum | grep terraform-docs-v${RELEASE_VERSION}-windows-amd64.zip | awk '{print $1}')
fi
if [ -z "${RELEASE_CHECKSUM}" ]; then
    echo "Error: release checksum is missing"
    exit 1
fi

PWD=$(cd "$(dirname "$0")" && pwd -P)

echo "Current Version: v${CURRENT_VERSION}"
echo "Release Version: v${RELEASE_VERSION}"

# Bump version in terraform-docs.nuspec
sed -i -E "s|<version>${CURRENT_VERSION}</version>|<version>${RELEASE_VERSION}</version>|g" "${PWD}/../../terraform-docs.nuspec"

# Bump version and checksum in tools/chocolateyinstall.ps1
sed -i -E "s|checksum = '.*$|checksum = '${RELEASE_CHECKSUM}'|g" "${PWD}/../../tools/chocolateyinstall.ps1"
sed -i -E "s|v${CURRENT_VERSION}|v${RELEASE_VERSION}|g" "${PWD}/../../tools/chocolateyinstall.ps1"

echo "Modified: terraform-docs.nuspec"
echo "Modified: tools/chocolateyinstall.ps1"

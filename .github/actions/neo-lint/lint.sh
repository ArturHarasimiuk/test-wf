#!/bin/bash
#
# Copyright (C) 2021 Intel Corporation
#
# SPDX-License-Identifier: MIT
#

set -ex

clang-format-11 --version

git -C neo fetch origin ${GITHUB_BASE_REF}
git -C neo diff -U0 --no-color --relative origin/${GITHUB_BASE_REF}..HEAD | clang-format-diff-11 -p1 -i
git -C neo status

if [ -n "$(git -C neo status --porcelain)" ]; then
    git -C neo status
    exit 1
fi

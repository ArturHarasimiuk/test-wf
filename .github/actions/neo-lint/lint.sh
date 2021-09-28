#!/bin/bash
#
# Copyright (C) 2021 Intel Corporation
#
# SPDX-License-Identifier: MIT
#

set -e

clang-format-11 --version

(
    cd neo
    git fetch origin ${GITHUB_BASE_REF}
    git diff -U0 --no-color origin/master..HEAD | clang-format-diff-11 -p1 -i
)

if [ -n "$(git -C neo status --porcelain)" ]; then
    git -C neo diff
    exit 1
fi

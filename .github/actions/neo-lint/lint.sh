#!/bin/bash
#
# Copyright (C) 2018-2021 Intel Corporation
#
# SPDX-License-Identifier: MIT
#

set -x

pwd
ls -la
env

git -C neo remote -vv
git -C neo log
git -C neo fetch origin master
git -C neo log
git -C neo show HEAD
git -C neo diff -U0 --no-color --relative origin/master..HEAD | clang-format-diff-11 -p1 -i
git -C neo status

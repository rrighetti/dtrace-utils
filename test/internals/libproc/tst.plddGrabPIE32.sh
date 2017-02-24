#!/bin/bash
#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#

#
# Copyright 2013 Oracle, Inc.  All rights reserved.
# Use is subject to license terms.

#
# This script tests that libproc can inspect the link maps of a subordinate
# 32-bit PIE process it grabs.
#

test/triggers/libproc-sleeper-pie-32 &
SLEEPER=$!
disown %+
while [[ $(readlink /proc/$SLEEPER/exe) =~ bash ]]; do :; done
test/triggers/libproc-pldd $SLEEPER
EXIT=$?
kill $SLEEPER
exit $EXIT

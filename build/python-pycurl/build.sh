#!/usr/bin/bash
#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License, Version 1.0 only
# (the "License").  You may not use this file except in compliance
# with the License.
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
# Copyright 2011-2012 OmniTI Computer Consulting, Inc.  All rights reserved.
# Use is subject to license terms.
#
# Load support functions
. ../../lib/functions.sh

PROG=pycurl
VER=7.43.0
SUMMARY="Python bindings for libcurl"
DESC="PycURL provides a thin layer of Python bindings on top of libcurl."

# In the future when we upgrade python again, be sure to wrap the following
# around with set_python_version and reassign PKG and RUN_DEPENDS_IPS.
# The only way buildctl detects packages is by grepping for PKG assignment.
XFORM_ARGS="-D PYTHONPKGVER=$PYTHONPKGVER"
PKG=library/python-2/pycurl-27
RUN_DEPENDS_IPS="runtime/python-27 library/security/openssl@1.0.2 web/curl"
init
download_source $PROG $PROG $VER
patch_source
prep_build
python_build
make_package
clean_up

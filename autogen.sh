#!/bin/sh
# Run this to generate all the initial makefiles, etc.

srcdir=`dirname $0`
test -z "$srcdir" && srcdir=.

REQUIRED_AUTOMAKE_VERSION=1.9

PKG_NAME="pango"

(test -f $srcdir/configure.in \
  && test -f $srcdir/README \
  && test -d $srcdir/pango) || {
    echo -n "**Error**: Directory "\`$srcdir\'" does not look like the"
    echo " top-level $PKG_NAME directory"
    exit 1
}

which gnome-autogen.sh || {
    echo "You need to install gnome-common from the GNOME SVN"
    exit 1
}
USE_GNOME2_MACROS=1 USE_COMMON_DOC_BUILD=no . gnome-autogen.sh

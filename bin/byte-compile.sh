#!/bin/sh
# byte-compile from command line

EMACS=`which emacs`
OPTS="-l ~/.emacs.d/load-path.el"
exec $EMACS -Q -batch $OPTS -f batch-byte-compile $*

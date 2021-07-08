#!/bin/sh -e



# Use the Python executable provided from the `-p` option, or a default.
[ "$1" = "-p" ] && PYTHON=$2 || PYTHON="python3"

PACKAGE=$(basename `pwd`)

autoflake --recursive ${PACKAGE}
black ${PACKAGE} --check
pip install -y ${PACKAGE}
pip install -e .

bash scripts/clean.sh


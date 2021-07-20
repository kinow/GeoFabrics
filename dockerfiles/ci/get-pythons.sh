#!/bin/sh

# FROM: https://gitlab.com/python-devs/ci-images/-/blob/master/get-pythons.sh

set -ex

cleanup_after_install () {
    find /usr/local -depth -type d -a  -name test -o -name tests -o  -type f -a -name '*.pyc' -o -name '*.pyo' -exec rm -rf '{}' +
    rm -rf /usr/src/python
}


get_install () {
    PY_VERSION=$1
    PY_DIR=${2:-$1}
    cd /tmp
    wget -q https://www.python.org/ftp/python/$PY_DIR/Python-$PY_VERSION.tgz
    tar xzf Python-$PY_VERSION.tgz
    cd /tmp/Python-$PY_VERSION
    ./configure && make && make altinstall
    cd /tmp
    rm Python-$PY_VERSION.tgz && rm -r Python-$PY_VERSION
}

get_install 3.6.14
get_install 3.7.11
get_install 3.8.11

cleanup_after_install

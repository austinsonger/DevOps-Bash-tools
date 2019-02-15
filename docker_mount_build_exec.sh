#!/usr/bin/env bash
#  vim:ts=4:sts=4:sw=4:et
#
#  Author: Hari Sekhon
#  Date: 2019-02-15 13:14:53 +0000 (Fri, 15 Feb 2019)
#
#  https://github.com/harisekhon/bash-tools
#
#  License: see accompanying Hari Sekhon LICENSE file
#
#  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
#
#  https://www.linkedin.com/in/harisekhon
#

set -eu
[ -n "${DEBUG:-}" ] && set -x
srcdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ $# != 1 ]; then
    echo "usage: ${00#*/} <docker_image>"
    exit 3
fi

docker_image="$1"

docker run -ti --rm -v $PWD:/code "$docker_image" /code/bash-tools/exec-interactive.sh '
    set -eu
    cd /code
    if which apk &>/dev/null; then
        apk add --no-cache make
    elif which apt-get &>/dev/null; then
        apt-get update
        apt-get install -y make
    elif which yum &>/dev/null; then
        yum install -y make
    fi
    make build test
'

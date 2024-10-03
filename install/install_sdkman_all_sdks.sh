#!/usr/bin/env bash
#
#  Author: Hari Sekhon
#  Date: 2019-10-08 16:48:17 +0100 (Tue, 08 Oct 2019)
#
#  https://github.com/austinsonger/DevOps-Bash-tools
#
#  License: see accompanying LICENSE file
#
#  https://www.linkedin.com/in/austinsonger
#

# Installs SDKman's most commonly used build tools e.g Java, Scala, Groovy + Maven, SBT, Gradle
#
# you may need to run ./install_sdkman.sh first

set -eo pipefail
[ -n "${DEBUG:-}" ] && set -x
srcdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

sdks="
java
scala
groovy
maven
gradle
sbt
"

if ! type sdk &>/dev/null; then
    "$srcdir/install_sdkman.sh"
fi

if [ -s ~/.sdkman/bin/sdkman-init.sh ]; then
    # shellcheck disable=SC1090,SC1091
    . ~/.sdkman/bin/sdkman-init.sh
fi

for x in $sdks; do
    set +o pipefail
    yes | sdk install "$x"
done

#!/usr/bin/env bash
#  vim:ts=4:sts=4:sw=4:et
#
#  Author: Hari Sekhon
#  Date: 2022-01-10 17:42:56 +0000 (Mon, 10 Jan 2022)
#
#  https://github.com/austinsonger/DevOps-Bash-tools
#
#  License: see accompanying Hari Sekhon LICENSE file
#
#  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
#
#  https://www.linkedin.com/in/austinsonger
#

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x
srcdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck disable=SC1090,SC1091
. "$srcdir/../lib/utils.sh"

# shellcheck disable=SC2034,SC2154
usage_description="
Installs Grype
"

# used by usage() in lib/utils.sh
# shellcheck disable=SC2034
usage_args="[<version> <specific>]"

help_usage "$@"

#version="${1:-0.8.18}"
version="${1:-latest}"
asset="${2:-all}"

export RUN_VERSION_ARG=1

"$srcdir/../github/github_install_binary.sh" GoogleCloudPlatform/terraformer "terraformer-$asset-{os}-{arch}" "$version" terraformer

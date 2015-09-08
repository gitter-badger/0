#!/bin/bash
if [ -z "$HOME" ]; then
	echo "ERROR: 'HOME' environment variable is not set!"
	exit 1
fi
# Source https://github.com/bash-origin/bash.origin
. "$HOME/.bash.origin"
function init {
	eval BO_SELF_BASH_SOURCE="$BO_READ_SELF_BASH_SOURCE"
	BO_deriveSelfDir ___TMP___ "$BO_SELF_BASH_SOURCE"
	local __BO_DIR__="$___TMP___"

	export PIO_PROFILE_SEED_PATH="$(dirname $(dirname $__BO_DIR__))/$(basename $(dirname $__BO_DIR__)).profile.seed"
	if [ -e "$PIO_PROFILE_SEED_PATH.sh" ]; then
        BO_sourcePrototype "$PIO_PROFILE_SEED_PATH.sh"

    	# NOTE: We now have a sensitive 'PIO_PROFILE_SECRET' variable in the
    	#       environment that should be removed as soon as it is no longer needed
    	#       and before any non-tooling related runtime processes start!
	fi

	export PORT=8090
	export ENVIRONMENT_NAME="127.0.0.1:$PORT"

}
init $@
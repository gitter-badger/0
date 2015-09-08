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

    BO_sourcePrototype "$__BO_DIR__/activate.sh"


	function StartResponder {
		BO_format "$VERBOSE" "HEADER" "Starting cores/responder"

		pushd "$__BO_DIR__/.." > /dev/null
			BO_ensure_nvm
#        	nvm install 0.12
			nvm use 0.12
			node .
		popd > /dev/null

		BO_format "$VERBOSE" "FOOTER"
	}


	# TODO: Do all startup init here using 'PIO_PROFILE_SECRET' and issue
	#       temporary access keys for runtime


	# This variable must not be used from now on
#	export PIO_PROFILE_SECRET=""

	StartResponder $@

}
init $@
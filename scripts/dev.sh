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


	function StartResponder {
		BO_log "$VERBOSE" "HEADER" "Starting cores/responder"

		pushd "$__BO_DIR__/.." > /dev/null
			BO_ensure_nvm
#        	nvm install 0.12
			nvm use 0.12
			export PORT=8090

			BO_realpath "_PROFILE_PATH" "$__BO_DIR__/../../$(basename $__BO_DIR__/..).profile.ccjson"
			export PROFILE_CONFIG_PATH="_PROFILE_PATH"
			export ENVIRONMENT_NAME="127.0.0.1:$PORT"

			node .
		popd > /dev/null

		BO_log "$VERBOSE" "FOOTER"
	}


	StartResponder $@

}
init $@
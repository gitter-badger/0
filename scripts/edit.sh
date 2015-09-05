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


	WORKSPACE_DIR="$__BO_DIR__/.."


	CACHE_DIR="$__BO_DIR__/../cache"
	if [ ! -e "$CACHE_DIR" ]; then
		mkdir "$CACHE_DIR"
	fi


	function Cloud9 {
		BO_format "$VERBOSE" "HEADER" "Running with Cloud9"

		# TODO: Check for declared version and if version changes re-install.

		BASE_PATH="$CACHE_DIR/github.com/c9/core"

		if [ ! -e "$BASE_PATH" ]; then
			if [ ! -e "$(dirname $BASE_PATH)" ]; then
				mkdir -p "$(dirname $BASE_PATH)"
			fi
			BO_log "$VERBOSE" "Cloning from 'git@github.com:c9/core.git' ..."
			git clone git@github.com:c9/core.git "$BASE_PATH"
			BO_log "$VERBOSE" "Installing at '$BASE_PATH' ..."
			pushd "$BASE_PATH" > /dev/null
				scripts/install-sdk.sh
			popd > /dev/null
		fi

		BO_log "$VERBOSE" "Running from '$BASE_PATH' ..."
		pushd "$BASE_PATH" > /dev/null
			BO_ensure_nvm
			nvm use 0.12
			(sleep 1 && open "http://127.0.0.1:8181")&
			node server.js --packed --port 8181 -w "$WORKSPACE_DIR"
		popd > /dev/null

		BO_format "$VERBOSE" "FOOTER"
	}


	Cloud9 $@
}
init $@
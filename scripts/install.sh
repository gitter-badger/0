#!/bin/bash
if [ -z "$HOME" ]; then
	echo "ERROR: 'HOME' environment variable is not set!"
	exit 1
fi

echo "dir"

pwd

#lib/bash.origin/bash.origin BO install; 

exit 1

# Source https://github.com/bash-origin/bash.origin
. "$HOME/.bash.origin"
function init {
	eval BO_SELF_BASH_SOURCE="$BO_READ_SELF_BASH_SOURCE"
	BO_deriveSelfDir ___TMP___ "$BO_SELF_BASH_SOURCE"
	local __BO_DIR__="$___TMP___"

	BO_log "$VERBOSE" "HEADER" "Installing 0 ..."

	pushd "$__BO_DIR__/.." > /dev/null
		if [ -f ".gitmodules" ]; then
			if [ ! -f ".gitmodules.initialized" ]; then
				BO_log "$VERBOSE" "Init submodules ..."
				git submodule update --init --recursive --rebase
				BO_log "$VERBOSE" "... submodules init done"
				touch ".gitmodules.initialized"
			else
				BO_log "$VERBOSE" "Skip init submodules. Already initialized."
			fi
		fi
	popd > /dev/null

#	BO_ensure_nvm
#	nvm install 0.12
#	nvm use 0.12

	# TODO: Only install declared and used dependencies

	pushd "$__BO_DIR__/../cores/responder/for/express" > /dev/null
        if [ ! -e "node_modules" ]; then
        	npm install
       	fi
	popd > /dev/null

	pushd "$__BO_DIR__/../cores/skin/for/semantic-ui" > /dev/null
        if [ ! -e "node_modules" ]; then
        	npm install
       	fi
	popd > /dev/null

	pushd "$__BO_DIR__/../cores/export/for/babel" > /dev/null
        if [ ! -e "node_modules" ]; then
        	npm install
       	fi
	popd > /dev/null

	pushd "$__BO_DIR__/../cores/export/for/browserify" > /dev/null
        if [ ! -e "node_modules" ]; then
        	npm install
       	fi
	popd > /dev/null

	pushd "$__BO_DIR__/../cores/export/for/defs" > /dev/null
        if [ ! -e "node_modules" ]; then
        	npm install
       	fi
	popd > /dev/null

	BO_log "$VERBOSE" "FOOTER"
}
init $@
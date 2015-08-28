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

	BO_log "$VERBOSE" "HEADER" "Installing 0 ..."

	BO_ensure_nvm
	nvm install 0.12
	nvm use 0.12

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
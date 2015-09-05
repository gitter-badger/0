#!/bin/bash
if [ -z "$npm_config_argv" ]; then
	echo "ERROR: Must run with 'npm install'!"
	exit 1
fi
if [ -z "$HOME" ]; then
	echo "ERROR: 'HOME' environment variable is not set!"
	exit 1
fi
WORKSPACE_DIR="$PWD"


pushd "$WORKSPACE_DIR" > /dev/null
	if [ -f ".gitmodules" ]; then
		if [ ! -f ".gitmodules.initialized" ]; then
			echo "Init submodules ..."
			git submodule update --init --recursive --rebase
			touch ".gitmodules.initialized"
		fi
	fi

	lib/bash.origin/bash.origin BO install

popd > /dev/null


# Source https://github.com/bash-origin/bash.origin
. "$HOME/.bash.origin"
function init {
	eval BO_SELF_BASH_SOURCE="$BO_READ_SELF_BASH_SOURCE"
	BO_deriveSelfDir ___TMP___ "$BO_SELF_BASH_SOURCE"
	local __BO_DIR__="$___TMP___"

	BO_format "$VERBOSE" "HEADER" "Installing 0 ..."

#	BO_ensure_nvm
#	nvm install 0.12
#	nvm use 0.12

	# TODO: Only install declared and used dependencies

	pushd "$__BO_DIR__/../components/Library/0" > /dev/null
        if [ ! -e "node_modules" ]; then
        	npm install
			pushd "node_modules/node-forge" > /dev/null

				# Fix path to 'r.js' when deploying to heroku using iojs
				export PATH="$__BO_DIR__/../components/Library/0/node_modules/node-forge/node_modules/.bin:$PATH"

	        	npm install
	        	npm run minify
			popd > /dev/null
       	fi
	popd > /dev/null

	pushd "$__BO_DIR__/../components/Polyfills/0" > /dev/null
        if [ ! -e "node_modules" ]; then
        	npm install
       	fi
	popd > /dev/null

	pushd "$__BO_DIR__/../cores/auth/for/passport" > /dev/null
        if [ ! -e "node_modules" ]; then
        	npm install
       	fi
	popd > /dev/null

	pushd "$__BO_DIR__/../cores/responder/for/express" > /dev/null
        if [ ! -e "node_modules" ]; then
        	npm install
       	fi
	popd > /dev/null

	pushd "$__BO_DIR__/../cores/proxy/for/smi.cache" > /dev/null
        if [ ! -e "node_modules" ]; then
        	npm install
       	fi
	popd > /dev/null

	pushd "$__BO_DIR__/../cores/skin/for/semantic-ui" > /dev/null
        if [ ! -e "node_modules" ]; then
        	npm install
       	fi
	popd > /dev/null

	pushd "$__BO_DIR__/../cores/data/for/knexjs" > /dev/null
        if [ ! -e "node_modules" ]; then
        	npm install
       	fi
	popd > /dev/null

	pushd "$__BO_DIR__/../cores/data/for/nedb" > /dev/null
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

	pushd "$__BO_DIR__/../cores/export/for/webpack" > /dev/null
        if [ ! -e "node_modules" ]; then
        	npm install
       	fi
	popd > /dev/null

	pushd "$__BO_DIR__/../cores/page/for/page" > /dev/null
        if [ ! -e "node_modules" ]; then
        	npm install
       	fi
	popd > /dev/null

	pushd "$__BO_DIR__/../cores/page/for/firewidgets" > /dev/null
        if [ ! -e "node_modules" ]; then
        	npm install
       	fi
	popd > /dev/null

	pushd "$__BO_DIR__/../cores/load/for/systemjs" > /dev/null
        if [ ! -e "node_modules" ]; then
        	npm install
       	fi
	popd > /dev/null

	pushd "$__BO_DIR__/../cores/load/for/requirejs" > /dev/null
        if [ ! -e "node_modules" ]; then
        	npm install
       	fi
	popd > /dev/null

	pushd "$__BO_DIR__/../cores/transform/for/marked" > /dev/null
        if [ ! -e "node_modules" ]; then
        	npm install
       	fi
	popd > /dev/null

	pushd "$__BO_DIR__/../lib/smi.cache" > /dev/null
        if [ ! -e "node_modules" ]; then
        	npm install
       	fi
	popd > /dev/null

	pushd "$__BO_DIR__/../lib/sm.hoist.VisualComponents" > /dev/null
        if [ ! -e "node_modules" ]; then
        	npm install
       	fi
	popd > /dev/null

	pushd "$__BO_DIR__/../lib/ccjson" > /dev/null
        if [ ! -e "node_modules" ]; then
        	npm install
       	fi
	popd > /dev/null

	pushd "$__BO_DIR__/../lib/pio.profile" > /dev/null
        if [ ! -e "node_modules" ]; then
        	npm install
       	fi
	popd > /dev/null


	"$__BO_DIR__/../lib/pio.profile/bin/install-pre-commit-hook" \
		"$__BO_DIR__/../cores/profile/for/pio.profile/pre-commit.sh"

	BO_format "$VERBOSE" "FOOTER"
}
init $@
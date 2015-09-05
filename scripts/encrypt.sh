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


    function Encrypt {
    	BO_format "$VERBOSE" "HEADER" "Encrypting System ..."

        "$__BO_DIR__/../cores/profile/for/pio.profile/encrypt.sh"

    	BO_format "$VERBOSE" "FOOTER"
    }

	Encrypt $@
}
init $@
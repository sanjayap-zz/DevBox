# Disable php xdebug command-line debugging session
# usage:
# . xdebug-cli-disable.sh
unset XDEBUG_SESSION_START;
unset XDEBUG_CONFIG;
unset PHP_IDE_CONFIG;
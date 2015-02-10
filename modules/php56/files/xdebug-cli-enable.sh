# Enable php xdebug command-line debugging session
# usage:
# . xdebug-cli-enable.sh "domain.org"
[ -x $1 ] && echo "Error: domain name argument is required" 1>&2 
export XDEBUG_SESSION_START="phpstorm-xdebug";
export XDEBUG_CONFIG="idekey=phpstorm-xdebug"
[ -n $1 ] && export PHP_IDE_CONFIG="serverName=$1";
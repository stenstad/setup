
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

#GO 
export GOPATH=$HOME/src/golang
export PATH=$PATH:$GOPATH/bin

# Pebble SDK
export PATH=/Users/ay/pebble-dev/PebbleSDK-current/bin:$PATH

export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


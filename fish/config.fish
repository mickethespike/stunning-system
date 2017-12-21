set -x PATH $PATH $HOME/bin $HOME/.local/bin $HOME/.cargo/bin

set -x TERM linux

setsid wal -r

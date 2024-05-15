# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

. "$HOME/.cargo/env"

# export GOPATH="$HOME/go"
# export PATH="$PATH:$GOPATH/bin"
# export QT_QPA_PLATFORM=wayland
export ELECTRON_OZONE_PLATFORM_HINT=auto
export PATH="$HOME/software:$PATH"

# eval "$(leetcode completions)"
# eval "$(starship init bash)"
# eval "$(wgcf completion bash)"

# base64 decode function
b64d() { echo -n $1 | base64 -d && echo; }

# warp
alias warpon="wg-quick up warp"
alias warpoff="wg-quick down warp"
alias warpstatus="wgcf trace | grep warp"

alias spiceup="spicetify update && spicetify restore backup apply"

alias pass="bitwarden"

alias codium="codium --unity-launch --enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland"

alias lofi="mpv --no-video https://www.youtube.com/watch?v=4xDzrJKXOOY"

# firefox profiles
alias whatsapp="firefox -p whatsapp &"
alias snuff="firefox -p git &"
alias dsa="firefox -p dsa &"

# libssh
# CMAKE_DEFAULT_OPTIONS="-DCMAKE_BUILD_TYPE=RelWithDebInfo -DPICKY_DEVELOPER=ON"
# CMAKE_BUILD_OPTIONS="-DWITH_BLOWFISH_CIPHER=ON -DWITH_SFTP=ON -DWITH_SERVER=ON -DWITH_ZLIB=ON -DWITH_PCAP=ON -DWITH_DEBUG_CRYPTO=ON -DWITH_DEBUG_PACKET=ON -DWITH_DEBUG_CALLTRACE=ON"
# CMAKE_TEST_OPTIONS="-DUNIT_TESTING=ON -DCLIENT_TESTING=ON -DSERVER_TESTING=ON -DWITH_BENCHMARKS=ON -DFUZZ_TESTING=ON"
# CMAKE_OPTIONS="$CMAKE_DEFAULT_OPTIONS $CMAKE_BUILD_OPTIONS $CMAKE_TEST_OPTIONS"
